//
//  Route.swift
//  RoutingResolver
//
//  Created by Alberto García-Muñoz on 30/5/21.
//

/// Protocol used to define a navigation
public protocol Route {}

extension Route {
    static var identifier: String { String(describing: self) }
}
