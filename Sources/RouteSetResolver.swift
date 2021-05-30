//
//  RouteSetResolver.swift
//  RoutingResolver
//
//  Created by Alberto García-Muñoz on 30/5/21.
//

import UIKit

/// Protocol to declare the resolver for an specific set of routes
public protocol RouteSetResolver: AnyObject {
    /// Routes to be resolved
    static var set: [Route.Type] { get }

    init()

    /// Method called once a route needs to be resolved
    /// - Parameter route: route to resolve
    /// - Returns: resolved controller
    func resolve(_ route: Route) -> UIViewController?
}
