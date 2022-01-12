//
//  Obfuscator.swift
//  Marvel
//
//  Created by Alexander Kraev on 21.11.2021.
//

import Foundation

enum SecretAPIKeys {

    static let privateKey: [UInt8]  = [9, 67, 66, 245, 146, 16, 65, 90, 67, 22, 91, 82, 88, 69, 69, 245, 146, 66, 75, 90, 22, 67, 92, 10, 13, 65, 66, 240, 198, 70, 20, 80, 65, 75, 92, 95, 9, 69, 19, 167] //f6271d333e5970571693f02ab422e2f91824f0ce
    static let publicKey: [UInt8] = [90, 69, 72, 246, 192, 77, 65, 90, 18, 64, 89, 94, 94, 66, 72, 160, 145, 69, 66, 88, 68, 22, 92, 95, 88, 23, 64, 247, 151, 21, 20, 8] // 5084c933b375178b21014e247b054afa
}

final class Obfuscator: Serviceable {
    
    // MARK: - Variables
    
    /// The salt used to obfuscate and reveal the string.
    var salt: String = ""
    
    // MARK: - Initialization
    
    init() {
        generateSalt()
        //bytesByObfuscatingString("0e5fbb50-e77e-4202-a74d-ea3eca6c1fe1")
        //log("--")
    }
    
    init(with salt: String) {
        self.salt = salt
    }
    
    // MARK: - Instance Methods
    
    @_optimize(none)
    func generateSalt() {
        typealias C = Character
        let a1: C, a2: C, a3: C, a4: C, a5: C, a6: C, a7: C, a8: C, a9: C, a0: C
        (a1, a2, a3, a4, a5, a6, a7, a8, a9, a0) = ("u", "o", "t", "r", "£", "k", "i", "s", "n", "p")
        self.salt = String("00000000000".characters().enumerated().map { i, e in //index character
            if i == 0 { return a2 } else
            if i == 1 { return a1 } else
            if i == 3 { return a5 } else
            if i == 4 { return a3 } else
            if i == 5 { return a4 } else
            if i == 6 { return a7 } else
            if i == 8 { return a8 } else
            if i == 9 { return a9 } else
            if i == 10{ return a6 } else
            { return a0 } // 2 & 7
        })
    }
    
    @_optimize(none)
    func bytesByObfuscatingString(_ string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var encrypted = [UInt8]()
        
        for t in text.enumerated() {
            encrypted.append(t.element ^ cipher[t.offset % length])
        }
        
        #if DEBUG
        print("Salt used: \(self.salt)\n")
        print("Swift Code:\n************")
        print("// Original \"\(string)\"")
        print("let key: [UInt8] = \(encrypted)\n")
        #endif
        
        return encrypted
    }
    
    @_optimize(none)
    func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var decrypted = [UInt8]()
        
        for k in key.enumerated() {
            decrypted.append(k.element ^ cipher[k.offset % length])
        }
        if let s = String(bytes: decrypted, encoding: .utf8) {
            return s
        }
        return ""
    }
}

extension String {
    func characters() -> [Character] {
        return self.map { $0 }
    }
}
