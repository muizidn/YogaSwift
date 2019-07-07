import Foundation
import CYoga

public enum ExperimentalFeature {
    case webFlexBasis
}

public class YogaNode {
    let node: YGNodeRef!
    public init(enableExperimental: ExperimentalFeature?) {
        let config = YGConfigNew()
        if let experimental = enableExperimental {
            switch experimental {
            case .webFlexBasis:
                YGConfigSetExperimentalFeatureEnabled(
                    config,
                    YGExperimentalFeatureWebFlexBasis,
                    true)
            }
        }
        node = YGNodeNewWithConfig(config)
    }
}

public protocol YogaLayoutProtocol {
    var yogaNode: YogaNode { get }
}

enum YogaUnit {
//    case undefined
    case percent
    case point
    case auto
}

public struct YogaUnitValue: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Float
    
    let value: FloatLiteralType
    let unit: YogaUnit
    
    init(_ value: FloatLiteralType, unit: YogaUnit) {
        self.value = value
        self.unit = unit
    }
    
    public init(floatLiteral value: FloatLiteralType) {
        self.value = value
        self.unit = .point
    }
    
    static let auto: YogaUnitValue = YogaUnitValue(0, unit: .auto)
}

postfix operator %
postfix operator ~

public extension Int {
    static postfix func %(_ lhs: Int) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .percent)
    }
    
    static postfix func ~(_ lhs: Int) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .point)
    }
}

public extension Float {
    static postfix func %(_ lhs: Float) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .percent)
    }
    
    static postfix func ~(_ lhs: Float) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .point)
    }
}

public extension CGFloat {
    static postfix func %(_ lhs: CGFloat) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .percent)
    }
    
    static postfix func ~(_ lhs: CGFloat) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .point)
    }
}

public extension Double {
    static postfix func %(_ lhs: Double) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .percent)
    }
    
    static postfix func ~(_ lhs: Double) -> YogaUnitValue {
        return YogaUnitValue(Float(lhs), unit: .point)
    }
}
