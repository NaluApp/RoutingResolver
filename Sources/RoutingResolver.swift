//
//  RoutingResolver.swift
//  RoutingResolver
//
//  Created by Alberto García-Muñoz on 30/5/21.
//

import UIKit

public protocol RoutingResolverRegistering {
    /// Method invoked the firs time a navigation is resolved. You should use it to register your resolvers
    static func registerAllRoutes()
}

public final class RoutingResolver {
    public static let main: RoutingResolver = RoutingResolver()
    static var mapping: [String: RouteSetResolver.Type] = [:]

    /// Resolves the route into a UIViewController
    /// - Parameter route: Route to be resolved
    /// - Returns: resolved UIViewController
    public func resolve<T: Route>(route: T) -> UIViewController? {
        registrationCheck()
        let resolver = RoutingResolver.mapping[T.identifier]
        assert(resolver != nil, "No resolver can solve this route: \(route)")
        let destination = resolver?.init().resolve(route)
        assert(destination != nil,
               "Resolver: \(resolver.map { String(describing: type(of: $0)) } ?? "no one") cannot solve this route: \(route)")
        return destination
    }

    /// Method used to associate a resolver to a route
    /// - Parameters:
    ///   - route: Route to register
    ///   - resolver: Resolver which will resolve the route
    public static func register(_ route: Route.Type, _ resolver: RouteSetResolver.Type) {
        let routeIdentifier = route.identifier
        assert(mapping[routeIdentifier] == nil, "Two resolvers cannot resolve the same route")
        mapping[routeIdentifier] = resolver
    }
}

@inline(__always)
private func registrationCheck() {
    guard RoutingResolver.mapping.isEmpty else {
        return
    }
    if let registering = (RoutingResolver.main as Any) as? RoutingResolverRegistering {
        type(of: registering).registerAllRoutes()
    }
}
