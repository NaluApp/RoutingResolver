//
//  TypeARouteResolver.swift
//  RoutingResolverTests
//
//  Created by Alberto García-Muñoz on 30/5/21.
//

import RoutingResolver
import UIKit

enum TypeBRoute: Route {
    case sampleA
    case sampleB
}

final class TypeBRouteSetResolver: RouteSetResolver {
    static var set: [Route.Type] { [TypeBRoute.self] }

    func resolve(_ route: Route) -> UIViewController? {
        switch route as? TypeBRoute {
        case .sampleA:
            return DummySampleATypeBViewController()
        case .sampleB:
            return DummySampleBTypeBViewController()
        default:
            return nil
        }
    }
}

final class DummySampleATypeBViewController: UIViewController {}
final class DummySampleBTypeBViewController: UIViewController {}
