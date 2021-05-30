//
//  APIError.swift
//  APIRequestTest
//
//  Created by Alberto García-Muñoz on 21/06/2019.
//  Copyright © 2019 SoundApp. All rights reserved.
//
import Foundation

public struct APIErrorResponse: Error, Equatable {
    public let url: String
    public let statusCode: Int
    public let data: Data?
    public let message: String
    
    public init(_ statusCode: Int, _ message: String, _ url: String, data: Data? = nil) {
        // Every time we add default values we have can't add _ as external name
        (self.url, self.statusCode, self.data, self.message) = (url, statusCode, data, message)
    }

    public static func == (lhs: APIErrorResponse, rhs: APIErrorResponse) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
}

public extension APIErrorResponse {
    static func network(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-1, "Network connection error", url)
    }
    
    static func parseData(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-2, "Cannot parse data from URL", url)
    }
    
    static func unknown(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-3, "Unknown error", url)
    }
    
    static func empty(_ url: String) -> APIErrorResponse {
        return APIErrorResponse(-4, "Empty data", url)
    }
}
