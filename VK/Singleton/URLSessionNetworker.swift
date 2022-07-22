//
//  URLSessionNetworker.swift
//  VK
//
//  Created by Alexander Bubeshka on 12.07.22.
//

import Foundation

class URLSessionNetworker {
    
    init (
        urlSession: URLSession = .shared
    ) {
        self.urlSession = urlSession
    }
    
    private let urlSession: URLSession
}
