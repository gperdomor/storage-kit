//
//  StorageResult.swift
//  StorageKit
//
//  Created by Gustavo Perdomo on 4/17/18.
//  Copyright © 2018 Gustavo Perdomo. All rights reserved.
//

import Vapor

public struct StorageResult {
    public let success: Bool
    public let response: Response?

    public init(success: Bool, response: Response?) {
        self.success = success
        self.response = response
    }
}
