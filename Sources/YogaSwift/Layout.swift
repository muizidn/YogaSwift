//
//  Layout.swift
//  YogaSwift
//
//  Created by PondokIOS on 07/07/19.
//

import Foundation

public extension YogaLayout {
    @discardableResult
    func width(_ value: YogaUnitValue) -> YogaLayout {
        self.width = value
        return self
    }
    
    @discardableResult
    func height(_ value: YogaUnitValue) -> YogaLayout {
        self.height = value
        return self
    }
    
    @discardableResult
    func padding(_ value: Edge) -> YogaLayout {
        self.padding = value
        return self
    }
    
    @discardableResult
    func border(_ value: Edge) -> YogaLayout {
        self.border = value
        return self
    }
    
    @discardableResult
    func margin(_ value: Edge) -> YogaLayout {
        self.margin = value
        return self
    }
}
