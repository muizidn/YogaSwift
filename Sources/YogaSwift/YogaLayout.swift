//
//  Layout.swift
//  YogaSwift
//
//  Created by PondokIOS on 07/07/19.
//

import Foundation
import CYoga

public class YogaLayout {
    internal let target: YogaLayoutProtocol
    internal init(target: YogaLayoutProtocol) {
        self.target = target
    }

    fileprivate var yogaNode: YGNodeRef {
        return target.yogaNode.node
    }

    var direction: Direction {
        get {
            let _default: Direction = .inherit
            let _direction = YGNodeLayoutGetDirection(yogaNode).rawValue
            return Direction(rawValue: _direction) ?? _default
        }

        set {
            YGNodeStyleSetDirection(
                yogaNode,
                YGDirection(rawValue: direction.rawValue))
        }
    }

    var flexDirection: FlexDirection {
        get {
            let _default: FlexDirection = .row
            let _direction = YGNodeStyleGetFlexDirection(yogaNode).rawValue
            return FlexDirection(rawValue: _direction) ?? _default
        }
        set {
            YGNodeStyleSetFlexDirection(
                yogaNode,
                YGFlexDirection(rawValue: newValue.rawValue))
        }
    }

    var flexGrow: Float {
        get {
            return YGNodeStyleGetFlexGrow(yogaNode)
        }
        set {
            YGNodeStyleSetFlexGrow(yogaNode, newValue)
        }
    }

    var flexShrink: Float {
        get {
            return YGNodeStyleGetFlexShrink(yogaNode)
        }
        set {
            return YGNodeStyleSetFlexShrink(yogaNode, newValue)
        }
    }

    var flexWrap: FlexWrap {
        get {
            let _default: FlexWrap = .noWrap
            let _wrap = YGNodeStyleGetFlexWrap(yogaNode).rawValue
            return FlexWrap(rawValue: _wrap) ?? _default
        }
        set {
            YGNodeStyleSetFlexWrap(
                yogaNode,
                YGWrap(rawValue: newValue.rawValue))
        }
    }

    var justifyContent: JustifyContent {
        get {
            let _default: JustifyContent = .flexStart
            let _justify = YGNodeStyleGetJustifyContent(yogaNode)
            return JustifyContent(rawValue: _justify.rawValue) ?? _default
        }
        set {
            YGNodeStyleSetJustifyContent(
                yogaNode,
                YGJustify(rawValue: newValue.rawValue))
        }
    }
    var alignItems: Align {
        get {
            let _default: Align  = .stretch
            let _align = YGNodeStyleGetAlignItems(yogaNode)
            return Align(rawValue: _align.rawValue) ?? _default
        }
        set {
            YGNodeStyleSetAlignItems(
                yogaNode,
                YGAlign(rawValue: newValue.rawValue))
        }
    }
    var alignSelf: Align {
        get {
            let _default: Align = .auto
            let _align = YGNodeStyleGetAlignSelf(yogaNode)
            return Align(rawValue: _align.rawValue) ?? _default
        }
        set {
            YGNodeStyleSetAlignSelf(
                yogaNode,
                YGAlign(rawValue: newValue.rawValue))
        }
    }
    var alignContent: Align {
        get {
            let _default: Align = .stretch
            let _align = YGNodeStyleGetAlignContent(yogaNode)
            return Align(rawValue: _align.rawValue) ?? _default
        }
        set {
            YGNodeStyleSetAlignContent(
                yogaNode,
                YGAlign(rawValue: newValue.rawValue))
        }
    }

    var width: YogaUnitValue {
        get {
            let _value = YGNodeStyleGetWidth(yogaNode)
            let _unit = YogaUnit(rawValue: _value.unit.rawValue) ?? YogaUnit.undefined
            return YogaUnitValue(_value.value, unit: _unit)
        }
        set {
            switch newValue.unit {
            case .auto:
                YGNodeStyleSetWidthAuto(yogaNode)
            case .percent:
                YGNodeStyleSetWidthPercent(yogaNode, newValue.value)
            case .point, .undefined:
                YGNodeStyleSetWidth(yogaNode, newValue.value)
            }
        }
    }

    var height: YogaUnitValue {
        get {
            let _value = YGNodeStyleGetHeight(yogaNode)
            let _unit = YogaUnit(rawValue: _value.unit.rawValue) ?? YogaUnit.undefined
            return YogaUnitValue(_value.value, unit: _unit)
        }
        set {
            switch newValue.unit {
            case .auto:
                YGNodeStyleSetHeightAuto(yogaNode)
            case .percent:
                YGNodeStyleSetHeightPercent(yogaNode, newValue.value)
            case .point, .undefined:
                YGNodeStyleSetHeight(yogaNode, newValue.value)
            }
        }
    }
    var aspectRatio: Float {
        get {
            return YGNodeStyleGetAspectRatio(yogaNode)
        }
        set {
            YGNodeStyleSetAspectRatio(yogaNode, newValue)
        }
    }
    var padding: Edge {
        get {
            return Edge(node: yogaNode, function: YGNodeStyleGetPadding)
        }
        set {
            switch newValue.value.unit {
            case .percent:
                YGNodeStyleSetPaddingPercent(
                    yogaNode,
                    newValue.edge.ygEdge,
                    newValue.value.value)
            default:
                YGNodeStyleSetPadding(
                    yogaNode,
                    newValue.edge.ygEdge,
                    newValue.value.value)
            }
        }
    }

    var border: Edge {
        get {
            return Edge(node: yogaNode, function: { (ref, edge) -> YGValue in
                let value = YGNodeStyleGetBorder(ref, edge)
                return YGValue(value: value, unit: YGUnitUndefined)
            })
        }
        set {
            YGNodeStyleSetBorder(
                yogaNode,
                newValue.edge.ygEdge,
                newValue.value.value)
        }
    }

    var margin: Edge {
        get {
            return Edge(node: yogaNode, function: YGNodeStyleGetMargin)
        }
        set {
            switch newValue.value.unit {
            case .percent:
                YGNodeStyleSetMarginPercent(
                    yogaNode,
                    newValue.edge.ygEdge,
                    newValue.value.value)
            case .auto:
                YGNodeStyleSetMarginAuto(
                    yogaNode,
                    newValue.edge.ygEdge)
            default:
                YGNodeStyleSetMargin(
                    yogaNode,
                    newValue.edge.ygEdge,
                    newValue.value.value)
            }
        }
    }

    var positionType: PositionType {
        get {
            let _default: PositionType = .relative
            let _type = YGNodeStyleGetPositionType(yogaNode)
            return PositionType(rawValue: _type.rawValue) ?? _default
        }
        set {
            YGNodeStyleSetPositionType(
                yogaNode,
                YGPositionType(rawValue: newValue.rawValue))
        }
    }

    var position: Edge {
        get {
            return Edge(node: yogaNode, function: YGNodeStyleGetPosition)
        }
        set {
            switch newValue.value.unit {
            case .percent:
                YGNodeStyleSetPositionPercent(
                    yogaNode,
                    newValue.edge.ygEdge,
                    newValue.value.value)
            default:
                YGNodeStyleSetPosition(
                    yogaNode,
                    newValue.edge.ygEdge,
                    newValue.value.value)
            }
        }
    }
}

public extension YogaLayoutProtocol {

    func layout() -> YogaLayout {
        return YogaLayout(target: self)
    }
}

public struct Edge {
    typealias SetFunction = (YGNodeRef?, YGEdge, Float) -> Void
    typealias GetFunction = (YGNodeConstRef?, YGEdge) -> YGValue
    var value: YogaUnitValue = 0~
    var edge: Enum = .all
    var node: YGNodeRef?
    var function: GetFunction?

    init(value: YogaUnitValue, edge: Enum) {
        self.value = value
        self.edge = edge
    }

    init(node: YGNodeRef, function: @escaping GetFunction) {
        self.node = node
        self.function = function
    }

    enum Enum: UInt32 {
        case left
        case top
        case right
        case bottom
        case start
        case end
        case horizontal
        case vertical
        case all

        var ygEdge: YGEdge {
            return YGEdge(self.rawValue)
        }
    }
}

public extension Edge {
    static func left(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .left)
    }

    static func top(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .top)
    }

    static func right(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .right)
    }

    static func bottom(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .bottom)
    }

    static func start(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .start)
    }

    static func end(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .end)
    }

    static func horizontal(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .horizontal)
    }

    static func vertical(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .vertical)
    }

    static func all(_ value: YogaUnitValue) -> Edge {
        return Edge(value: value, edge: .all)
    }
}

extension Edge {
    func left() -> Float! {
        if case .left = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .left but found \(edge)")
        }
    }

    func top() -> Float! {
        if case .top = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .top but found \(edge)")
        }
    }

    func right() -> Float! {
        if case .right = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .right but found \(edge)")
        }
    }

    func bottom() -> Float! {
        if case .bottom = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .bottom but found \(edge)")
        }
    }

    func start() -> Float! {
        if case .start = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .start but found \(edge)")
        }
    }

    func end() -> Float! {
        if case .end = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .end but found \(edge)")
        }
    }

    func horizontal() -> Float! {
        if case .horizontal = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .horizontal but found \(edge)")
        }
    }

    func vertical() -> Float! {
        if case .vertical = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .vertical but found \(edge)")
        }
    }

    func all() -> Float! {
        if case .all = edge, let function = function {
            return function(node, edge.ygEdge).value
        } else {
            fatalError("Require .all but found \(edge)")
        }
    }
}
