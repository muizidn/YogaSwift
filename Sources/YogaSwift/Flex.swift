//
//  Flex.swift
//  YogaSwift
//
//  Created by PondokIOS on 07/07/19.
//

import Foundation

public extension YogaLayout {
    
    @discardableResult
    func direction(_ value: Direction) -> YogaLayout {
        self.direction = value
        return self
    }

    @discardableResult
    func flexDirection(_ value: FlexDirection) -> YogaLayout {
        self.flexDirection = value
        return self
    }

    @discardableResult
    func flexGrow(_ value: YogaUnitValue) -> YogaLayout {
        self.flexGrow = value
        return self
    }

    @discardableResult
    func flexShrink(_ value: YogaUnitValue) -> YogaLayout {
        self.flexShrink = value
        return self
    }

    @discardableResult
    func flexWrap(_ wrap: FlexWrap) -> YogaLayout {
        self.flexWrap = wrap
        return self
    }
}

public enum Direction: UInt32 {
    case inherit
    case leftToRight
    case rightToLeft
}

public enum FlexDirection: UInt32 {
    case column
    case columnReverse
    case row
    case rowReverse
}

public enum FlexWrap {
    case noWrap
    case wrap
    case wrapReverse
}
