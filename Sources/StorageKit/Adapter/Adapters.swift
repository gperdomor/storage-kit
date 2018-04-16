//
//  Adapters.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Service

/// Represents the adapters currently configured for FileSystem.
public struct Adapters: Service {
    /// Internal storage: [AdapterIdentifier: Adapter]
    internal let storage: [String: Any]

    /// Creates a new Adapters struct.
    internal init(_ storage: [String: Any]) {
        self.storage = storage
    }

    /// Fetches the adapter for a given ID.
    public func adapter<A>(for id: AdapterIdentifier<A>) -> A? {
        return storage[id.uid] as? A
    }
}
