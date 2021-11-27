//
//  SubscribedUrlString.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import Foundation

extension String {
    
    var subscribedUrlString: String {
        let ts = Date.currentTimeStamp
        let publicKey = Obfuscator.injected.reveal(key: SecretAPIKeys.publicKey)
        let privateKey = Obfuscator.injected.reveal(key: SecretAPIKeys.privateKey)
        let hash = MD5(ts + privateKey + publicKey)
        let subscribedUrlString = self + "?&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        return subscribedUrlString
    }
}
