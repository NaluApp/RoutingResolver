//
//  TypeARouteResolver.swift
//  RoutingResolverTests
//
//  Created by Alberto García-Muñoz on 30/5/21.
//

import RoutingResolver
import UIKit

enum TypeARoute: Route {
    case sampleA
    case sampleB
}

final class TypeARouteSetResolver: RouteSetResolver {
    static var set: [Route.Type] {
        [TypeARoute.self]
    }

    func resolve(_ route: Route) -> UIViewController? {
        switch route as? TypeARoute {
        case .sampleA:
            return DummySampleATypeAViewController()
        case .sampleB:
            return DummySampleBTypeAViewController()
        default:
            return nil
        }
    }
}

final class DummySampleATypeAViewController: UIViewController {}
final class DummySampleBTypeAViewController: UIViewController {}
