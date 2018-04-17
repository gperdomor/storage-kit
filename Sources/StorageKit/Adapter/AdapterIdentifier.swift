//
//  AdapterIdentifier.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

/// Each adapter in your application receives its own identifier.
/// Your main adapter should use the `.default` identifier.
/// Create identifiers for your non-default adapters by adding
/// a static extension to this struct:
///
///     extension AdapterIdentifier {
///         /// My custom Adapter.
///         public static var myCustom: AdapterIdentifier {
///             return AdapterIdentifier("myCustom")
///         }
///     }
///
public struct AdapterIdentifier<A: Adapter> {
    /// The unique id.
    public let uid: String

    /// Create a new adapter identifier.
    public init(_ uid: String, type: A.Type = A.self) {
        self.uid = uid
    }
}

extension AdapterIdentifier: Equatable {
    /// See Equatable.==
    public static func == (lhs: AdapterIdentifier, rhs: AdapterIdentifier) -> Bool {
        return lhs.uid == rhs.uid
    }
}

extension AdapterIdentifier: Hashable {
    /// See Hashable.hashValue
    public var hashValue: Int {
        return uid.hashValue
    }
}

// MARK: Default

extension AdapterIdentifier: CustomStringConvertible {
    public var description: String {
        return uid
    }
}
