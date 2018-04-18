//
//  Adapter.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/16/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Async
import Foundation
import Vapor

/// `Adapter` provides an interface with commons operations to handle files.
public protocol Adapter: class {
    /// Reads the content of the file.
    ///
    /// - Parameters:
    ///   - path: Path to the file to be reading.
    ///   - container: Vapor Container.
    /// - Returns: Future with the Data of the content of the file, if exists.
    /// - Throws: `AdapterError`.
    func read(at path: String, on container: Container) throws -> Future<Data?>

    /// Writes the given content into the file.
    ///
    /// - Parameters:
    ///   - content: The content of the file.
    ///   - path: Path where will be written.
    ///   - container: Vapor Container.
    /// - Returns: Future<StorageResult>
    /// - Throws: `AdapterError`.
    func write(content: Data, at path: String, on container: Container) throws -> Future<StorageResult>

    /// Indicates whether the file exists.
    ///
    /// - Parameters:
    ///   - path: A path.
    ///   - container: Vapor Container.
    /// - Returns: Future with `true`if the path exists, `false` otherwise.
    /// - Throws: `AdapterError`.
    func exists(at path: String, on container: Container) throws -> Future<Bool>

    /// Returns an array of all paths (files and directories).
    ///
    /// - Parameter container: <#container description#>
    /// - Returns: Future with Array of paths.
    /// - Throws: `AdapterError`.
    func list(on container: Container) throws -> Future<[String]>

    /// Deletes the path.
    ///
    /// - Parameters:
    ///   - path: A path.
    ///   - container: Vapor Container.
    /// - Returns: Future<StorageResult>
    /// - Throws: `AdapterError`.
    func delete(at path: String, on container: Container) throws -> Future<StorageResult>

    /// Renames the file.
    ///
    /// - Parameters:
    ///   - path: A path.
    ///   - target: A path.
    ///   - container: Vapor Container.
    /// - Returns: Future<StorageResult>
    /// - Throws: `AdapterError`
    func rename(at path: String, to target: String, on container: Container) throws -> Future<StorageResult>

    /// Check if the path is a directory.
    ///
    /// - Parameters:
    ///   - path: A path.
    ///   - container: Vapor Container.
    /// - Returns: Future with `true`if the path is adirectory, `false` otherwise.
    /// - Throws: `AdapterError`.
    func isDirectory(at path: String, on container: Container) throws -> Future<Bool>
}
