//
//  RoutingResolverTests.swift
//  RoutingResolverTests
//
//  Created by Alberto García-Muñoz on 30/5/21.
//

import RoutingResolver
import XCTest

class RoutingResolverTests: XCTestCase {
    func testResolveTypeA() {
        XCTAssertTrue(RoutingResolver.main.resolve(route: TypeARoute.sampleA) is DummySampleATypeAViewController)
        XCTAssertTrue(RoutingResolver.main.resolve(route: TypeARoute.sampleB) is DummySampleBTypeAViewController)
    }

    func testResolveTypeB() {
        XCTAssertTrue(RoutingResolver.main.resolve(route: TypeBRoute.sampleA) is DummySampleATypeBViewController)
        XCTAssertTrue(RoutingResolver.main.resolve(route: TypeBRoute.sampleB) is DummySampleBTypeBViewController)
    }
}

extension RoutingResolver: RoutingResolverRegistering {
    public static func registerAllRoutes() {
        register(TypeARoute.self, TypeARouteSetResolver.self)
        register(TypeBRoute.self, TypeBRouteSetResolver.self)
    }
}
