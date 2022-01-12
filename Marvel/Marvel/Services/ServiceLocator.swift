//
//  ServiceLocator.swift
//  Marvel
//
//  Created by Alexander Kraev on 21.11.2021.
//

import Foundation

//Short access
let ServiceLocator = ServiceLocatorImpl.assembly

// MARK: - Protocols for object for DI
protocol Injectable { static var injected: Self { get } }
extension Injectable { static var injected: Self { ServiceLocator.inject() } }
protocol Serviceable: Injectable {}

// MARK: - Inject property wrapper
// Most preferred
// Example: @Injected private var apiManager: APIManager
@propertyWrapper class Injected<T: Injectable> {
    private var dependency: T!
    
    var wrappedValue: T {
        get {
            if dependency == nil {
                let copy: T = ServiceLocator.inject()
                self.dependency = copy
            }
            return dependency
        }
        
        set { dependency = newValue }
    }
}

// MARK: - Service locator implementation
final class ServiceLocatorImpl {
    
    private var registry = [ObjectIdentifier: Any]()
    
    private(set) static var assembly: ServiceLocatorImpl = .init()
    
    private init() {
        registerMultiplatformServices()
        registeriOSServices()
    }
    
    // MARK: Registration
    func register<Service: Injectable>(factory: @escaping () -> Service) {
        let serviceId: ObjectIdentifier = .init(Service.self)
        registry[serviceId] = factory
    }
    
    func registerSingleton<Service: Injectable>(instance: Service) {
        let serviceId: ObjectIdentifier = .init(Service.self)
        registry[serviceId] = instance
    }
    
    func registerLazySingleton<Service: Injectable>(factory: @escaping () -> Service) {
        let serviceId: ObjectIdentifier = .init(Service.self)
        registry[serviceId] = LazySingletonWrapper(creator: factory)
    }
    
    // MARK: Injection
    
    func inject<Service: Injectable>() -> Service {
        let serviceId: ObjectIdentifier = .init(Service.self)
        //log("💉 ServiceLocator inject \(serviceId) - \(registry)")
        if let factory = registry[serviceId] as? () -> Service {
            return factory()
        } else if let singletonInstance = registry[serviceId] as? Service {
            return singletonInstance
        } else if let lazySingletonInstance = registry[serviceId] as? LazySingletonWrapper,
                  let object = lazySingletonInstance.resolve() as? Service {
            return object
        } else {
            // Possible replace with EmptyService
            fatalError("No registered entry for \(Service.self)")
        }
    }
}

fileprivate extension ServiceLocatorImpl {
    // register only services available in all Targets: iOS + App Extensions
    func registerMultiplatformServices() {
        // Security
        register { Obfuscator() }
    }
    
    func registeriOSServices() {
        // Initializing
        registerSingleton(instance: Initializator())
    }
}

fileprivate final class LazySingletonWrapper {
    var object: Injectable?
    var creator: () -> Injectable
    
    init(creator: @escaping () -> Injectable) { self.creator = creator }
    
    func resolve() -> Injectable {
        guard let object = object else {
            self.object = creator()
            return object!
        }
        return object
    }
}
