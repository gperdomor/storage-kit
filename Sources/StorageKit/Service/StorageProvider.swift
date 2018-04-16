//
//  StorageProvider.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Service

/// Registers filesystem services.
public final class StorageProvider: Provider {
    /// See Provider.repositoryName
    public static let repositoryName = "storage-kit"

    /// Creates a new `StorageProvider`
    public init() {}

    /// See Provider.register
    public func register(_ services: inout Services) throws {
        services.register { container -> Adapters in
            let config = try container.make(AdapterConfig.self)
            var adapters: [String: Any] = [:]
            for (id, lazyAdapter) in config.adapters {
                let fs = try lazyAdapter(container)
                adapters[id] = fs
            }
            return Adapters(adapters)
        }
    }

    /// See Provider.didBoot
    public func didBoot(_ worker: Container) throws -> Future<Void> {
        return .done(on: worker)
    }
}