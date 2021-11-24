//
//  URLSessionRequestBuilderFactoryMarvel.swift
//  Marvel
//
//  Created by c-villain on 21.11.2021.
//

import Foundation
import MarvelNetwork

final class MarvelRequestBuilderFactory: RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type {
        return RequestBuilder<T>.self
    }

    func getBuilder<T:Decodable>() -> RequestBuilder<T>.Type {
        return MarvelDecodableRequestBuilder<T>.self
    }
}

class MarvelDecodableRequestBuilder<T: Decodable>: URLSessionDecodableRequestBuilder<T> {
    
    override func createURLRequest(urlSession: URLSession, method: HTTPMethod, encoding: ParameterEncoding, headers: [String:String]) throws -> URLRequest {

//        let ts = Date.currentTimeStamp
//        let publicKey = Obfuscator.injected.reveal(key: SecretAPIKeys.publicKey)
//        let privateKey = Obfuscator.injected.reveal(key: SecretAPIKeys.privateKey)
//        let hash = MD5(ts + privateKey + publicKey)
//        let subscribedUrlString = URLString + "&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
//        
        guard let url = URL(string: URLString.subscribedUrlString) else {
            throw DownloadException.requestMissingURL
        }

        var originalRequest: URLRequest = .init(url: url)
        
        originalRequest.httpMethod = method.rawValue
        
        buildHeaders().forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        headers.forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        let modifiedRequest = try encoding.encode(originalRequest, with: parameters)
        
        return modifiedRequest
    }
}
