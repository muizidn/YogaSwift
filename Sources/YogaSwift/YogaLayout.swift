//
//  Layout.swift
//  YogaSwift
//
//  Created by PondokIOS on 07/07/19.
//

import Foundation

public class YogaLayout {
    internal let target: YogaLayoutProtocol
    internal init(target: YogaLayoutProtocol) {
        self.target = target
    }
    
    var direction: Direction = .inherit
    var flexDirection: FlexDirection = .row
    var flexGrow: YogaUnitValue = 0~
    var flexShrink: YogaUnitValue = 1~
    var flexWrap: FlexWrap = .noWrap
    
    var justifyContent: JustifyContent = .flexStart
    var alignItems: Align = .stretch
    var alignSelf: Align = .auto
    var alignContent: Align = .stretch
    
    var width: YogaUnitValue = .auto
    var height: YogaUnitValue = .auto
    var aspectRatio: YogaUnitValue = .auto
    var padding: Edge = .all(0)
    var border: Edge = .all(0)
    var margin: Edge = .all(0)
}

public enum Edge {
    case left(Float)
    case top(Float)
    case right(Float)
    case bottom(Float)
    case start(Float)
    case end(Float)
    case horizontal(Float)
    case vertical(Float)
    case all(Float)
}

public extension YogaLayoutProtocol {

    func layout() -> YogaLayout {
        return YogaLayout(target: self)
    }
}
