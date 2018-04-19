//
//  Container+Storage.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Service

/// Create a file system adapter.
extension Container {
    /// Returns a future adapter for the supplied adapter identifier if one can be fetched.
    public func withStorage<Adapter, A>(
        to adapter: AdapterIdentifier<Adapter>,
        closure: @escaping (Adapter) throws -> Future<A>
        ) -> Future<A> {
        return requestStorage(to: adapter).flatMap(to: A.self) { conn in
            return try closure(conn).map(to: A.self) { result in
                return result
            }
        }
    }
}

/// Request file system adapters.
extension Container {
    /// Requests a storage to the adapter.
    public func requestStorage<Adapter>(
        to adapter: AdapterIdentifier<Adapter>
        ) -> Future<Adapter> {
        return Future.map(on: self) {
            let adapters = try self.make(Adapters.self)

            guard let storage = adapters.adapter(for: adapter) else {
                throw StorageKitError(
                    identifier: "requestStorage",
                    reason: "No adapter with id `\(adapter.uid)` is configured.",
                    source: .capture()
                )
            }

            return storage
        }
    }
}
