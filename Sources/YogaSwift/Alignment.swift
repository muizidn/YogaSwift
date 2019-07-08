//
//  Alignment.swift
//  YogaSwift
//
//  Created by PondokIOS on 07/07/19.
//

import Foundation

public extension YogaLayout {
    @discardableResult
    func justifyContent(_ value: JustifyContent) -> YogaLayout {
        self.justifyContent = value
        return self
    }

    @discardableResult
    func alignItems(_ value: Align) -> YogaLayout {
        self.alignItems = value
        return self
    }

    @discardableResult
    func alignSelf(_ value: Align) -> YogaLayout {
        self.alignSelf = value
        return self
    }

    @discardableResult
    func alignContent(_ value: Align) -> YogaLayout {
        self.alignContent = value
        return self
    }
}

public enum JustifyContent: UInt32 {
    case flexStart
    case center
    case flexEnd
    case spaceBetween
    case spaceAround
    case spaceEvenly
}

public enum Align: UInt32 {
    case auto
    case flexStart
    case center
    case flexEnd
    case stretch
    case baseline
    case spaceBetween
    case spaceAround
}
