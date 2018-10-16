
import Foundation

public enum YAxisAnchor {
    case top, bottom, centerY, firstBaseline, lastBaseline
    
    internal var keypath: KeyPath<Constrainable, NSLayoutYAxisAnchor> {
        
        switch self {
        case .top:
            return \Constrainable.topAnchor
        case .bottom:
            return \Constrainable.bottomAnchor
        case .centerY:
            return \Constrainable.centerYAnchor
        case .firstBaseline:
            return \Constrainable.firstBaselineAnchor
        case .lastBaseline:
            return \Constrainable.lastBaselineAnchor
        }
    }
}

public enum XAxisAnchor {
    
    case leading, trailing, left, right, centerX
    
    internal var keypath: KeyPath<Constrainable, NSLayoutXAxisAnchor> {
        switch self {
        case .leading:
            return \Constrainable.leadingAnchor
        case .trailing:
            return \Constrainable.trailingAnchor
        case .left:
            return \Constrainable.leftAnchor
        case .right:
            return \Constrainable.rightAnchor
        case .centerX:
            return \Constrainable.centerXAnchor
        }
    }
}

public enum DimensionAnchor {
    
    case width, height
    
    internal var keypath: KeyPath<Constrainable, NSLayoutDimension> {
        switch self {
        case .height:
            return \Constrainable.heightAnchor
        case .width:
            return \Constrainable.widthAnchor
        }
    }
}

public func constraint(_ originXAxisAnchor: XAxisAnchor, to destinationXAxisAnchor: XAxisAnchor, of destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(originXAxisAnchor.keypath, to: destinationXAxisAnchor.keypath, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint(_ originYAxisAnchor: YAxisAnchor, to destinationYAxisAnchor: YAxisAnchor, of destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(originYAxisAnchor.keypath, to: destinationYAxisAnchor.keypath, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint(same xAxisAnchor: XAxisAnchor, as destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(xAxisAnchor, to: xAxisAnchor, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint(same yAxisAnchor: YAxisAnchor, as destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(yAxisAnchor, to: yAxisAnchor, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint(_ originDimensionAnchor: DimensionAnchor, to destinationDimensionAnchor: DimensionAnchor, of destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(originDimensionAnchor.keypath, to: destinationDimensionAnchor.keypath, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint(same dimensionAnchor: DimensionAnchor, as destination: Constrainable, relation: ConstraintsRelation = .equal, offset: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(dimensionAnchor.keypath, to: dimensionAnchor.keypath, of: destination, relation: relation, offset: offset, multiplier: multiplier, priority: priority, identifier: identifier)
}

public func constraint(_ dimensionAnchor: DimensionAnchor, to constant: CGFloat, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, identifier: String? = nil) -> Constraint {
    return constraint(dimensionAnchor.keypath, to: constant, multiplier: multiplier, priority: priority, identifier: identifier)
}
