# 🗺 RoutingResolver
> Isolate the view controller from your routing.

[![Github](https://img.shields.io/badge/contact-%40AlbGarciam-blue)](http://github.com/AlbGarciam)
[![Swift](https://img.shields.io/badge/swift-5-orange)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager)

## 🌟 Features

Routing resolver allows you to resolve a navigation into an UIViewController without needing to handle with it. It is specially useful when you don't want to expose your custom UIViewControllers outside your framework.

## Usage

There are two separate steps when using `RoutingResolver`

### Register navigations

In order to register your own navigations, you have to implement `registerAllRoutes` method of `RoutingResolverRegistering`:

```swift
extension RoutingResolver: RoutingResolverRegistering {
    public static func registerAllRoutes() {
        register(TypeARoute.self, TypeARouteSetResolver.self)
        register(TypeBRoute.self, TypeBRouteSetResolver.self)
    }
}
```

`register` method will take two separate arguments, the first one is the `Route` that we want to register and the second one is the `RouteSetResolver` we want to associate to it. 

---
**NOTE**

You can only register one resolver for each route

---

### Resolve navigation

`RouteSetResolver` will require you to declare the set of navigations you want to handle. You'll also need to implement `resolve` method. This method will resolve the `Route` into an `UIViewController`

```swift
enum TypeARoute: Route {
    case sampleA
    case sampleB
}

final class TypeARouteSetResolver: RouteSetResolver {
    static var set: [Route.Type] { [TypeARoute.self] }

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
```

## 🛠 Compatibility

This framework is based on UIKit, so every platform that supports UIKit supports this framework
* iOS
* iPadOS
* tvOS

## ⚙️ Installation

#### You can use the [Swift Package Manager](https://github.com/apple/swift-package-manager) by declaring RoutingResolver as a dependency in your `Package.swift` file:

```swift
.package(url: "https://github.com/AlbGarciam/RoutingResolver", from: "0.1.0")
```

## 🍻 Etc.

- Contributions are very welcome. 
- Attribution is appreciated (let's spread the word!), but not mandatory.

## 👨‍💻 Author

Alberto García – [@AlbGarciam](https://github.com/AlbGarciam)

## 👮‍♂️ License

*RoutingResolver* is available under the MIT license. See the [LICENSE](LICENSE) file for more info.