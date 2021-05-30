//
//  APIRequest.swift
//  APIRequestTest
//
//  Created by Alberto García-Muñoz on 21/06/2019.
//  Copyright © 2019 SoundApp. All rights reserved.
//

import Combine
import Foundation

public enum Methods: String, Codable {
    case GET, POST, UPDATE, DELETE, PATCH
}

public protocol APIRequest {
    associatedtype Response: Codable // The way to add a generic into a protocol
    
    typealias APIRequestResponse = Result<Response, APIErrorResponse>
    typealias APIRequestCompletion = (APIRequestResponse) -> ()
    
    var method: Methods { get }
    var body: Any { get }
    var baseUrl: String { get }
    var path: String { get }
    var headers: [String:String] { get }
    var parameters: [String:String] { get }
}

public extension APIRequest {
    var baseUrl: String { "nalu-app-server.herokuapp.com" }
    var parameters: [String:String] { return [:] }
    var headers: [String:String] { return ["Accept": "application/json"] }
    var body: Any { return [:] }
    
    func getRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseUrl
        components.path = path

        if !parameters.isEmpty {
            components.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        }

        guard let finalURL = components.url else {
            fatalError("Impossible to retrieve final URL")
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        request.httpBody = method != .GET ? try? JSONSerialization.data(withJSONObject: body, options: []) : nil
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = 30
        
        return request
    }

    func makeRequest() -> AnyPublisher<Response, APIErrorResponse> {
        APISession.request(request: self)
            .tryMap {
                if Response.self == Data.self {
                    return $0 as! Response
                }
                return try JSONDecoder().decode(Response.self, from: $0)
            }
            .mapError { failure -> APIErrorResponse in
                if let failure = failure as? APIErrorResponse { return failure }
                return APIErrorResponse.parseData(path)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
