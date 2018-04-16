//
//  AdapterConfig.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Service

/// Helper struct for configuring adapters.
public struct AdapterConfig: Service {
    /// Lazy closure for initializing an adapter.
    public typealias LazyAdapter<A: Adapter> = (Container) throws -> A

    /// The configured adapters.
    public var adapters: [String: (Container) throws -> Any]

    /// Create a new adapter config helper.
    public init() {
        self.adapters = [:]
    }

    /// Add a pre-initialized adapter to the config.
    public mutating func add<A>(adapter: A, as id: AdapterIdentifier<A>) {
        adapters[id.uid] = { _ in adapter }
    }

    /// Add an adapter type to the config. The application container will be asked to create this
    /// adapter type when it is used.
    public mutating func add<A>(adapter: A.Type, as id: AdapterIdentifier<A>) {
        adapters[id.uid] = { try $0.make(A.self) }
    }

    /// Adds a lazy-initialized adapter to the config.
    public mutating func add<A>(as id: AdapterIdentifier<A>, adapter: @escaping LazyAdapter<A>) {
        adapters[id.uid] = adapter
    }
}
