import UIKit

@usableFromInline
internal func pin<Anchor, Axis>(
  _ originKeyPath: KeyPath<Constrainable, Anchor>,
  to referenceKeyPath: KeyPath<Constrainable, Anchor>,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory where Anchor: NSLayoutAnchor<Axis> {
  return { constrainable in
    let constraint: NSLayoutConstraint
    switch relation {
    case .equal:
      constraint = constrainable[keyPath: originKeyPath]
        .constraint(
          equalTo: reference[keyPath: referenceKeyPath],
          constant: offset
        )
        .withMultiplier(multiplier)
    case .lessThanOrEqual:
      constraint =  constrainable[keyPath: originKeyPath]
        .constraint(
          lessThanOrEqualTo: reference[keyPath: referenceKeyPath],
          constant: offset
        )
        .withMultiplier(multiplier)
    case .greaterThanOrEqual:
      constraint =  constrainable[keyPath: originKeyPath]
        .constraint(
          greaterThanOrEqualTo: reference[keyPath: referenceKeyPath],
          constant: offset
        )
        .withMultiplier(multiplier)
    @unknown default:
      fatalError()
    }
    constraint.priority = priority
    constraint.identifier = identifier
    return [constraint]
  }
}

@usableFromInline
internal func match<LayoutDimension>(
  _ originKeyPath: KeyPath<Constrainable, LayoutDimension>,
  to referenceKeyPath: KeyPath<Constrainable, LayoutDimension>,
  of reference: Constrainable, relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory where LayoutDimension: NSLayoutDimension {
  return { constrainable in
    let constraint: NSLayoutConstraint
    switch relation {
    case .equal:
      constraint = constrainable[keyPath: originKeyPath]
        .constraint(
          equalTo: reference[keyPath: referenceKeyPath],
          multiplier: multiplier,
          constant: offset
        )
    case .lessThanOrEqual:
      constraint = constrainable[keyPath: originKeyPath]
        .constraint(
          lessThanOrEqualTo: reference[keyPath: referenceKeyPath],
          multiplier: multiplier,
          constant: offset
        )
    case .greaterThanOrEqual:
      constraint = constrainable[keyPath: originKeyPath]
        .constraint(
          greaterThanOrEqualTo: reference[keyPath: referenceKeyPath],
          multiplier: multiplier,
          constant: offset
        )
    @unknown default:
      fatalError()
    }
    constraint.identifier = identifier
    constraint.priority = priority
    return [constraint]
  }
}

@usableFromInline
internal func match<Anchor, Axis>(
  _ keyPath: KeyPath<Constrainable, Anchor>,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil) -> ConstraintsFactory where Anchor: NSLayoutAnchor<Axis> {
  return pin(
    keyPath,
    to: keyPath,
    of: reference,
    relation: relation,
    offset: offset, multiplier:
    multiplier,
    priority: priority,
    identifier: identifier
  )
}

@usableFromInline
internal func match<LayoutDimension>(
  _ keyPath: KeyPath<Constrainable, LayoutDimension>,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory where LayoutDimension: NSLayoutDimension {
  return pin(
    keyPath, to: keyPath,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

@usableFromInline
internal func set<LayoutDimension>(
  _ keyPath: KeyPath<Constrainable, LayoutDimension>,
  to constant: CGFloat,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory where LayoutDimension: NSLayoutDimension {
  return { constrainable in
    let constraint = constrainable[keyPath: keyPath].constraint(equalToConstant: (constant * multiplier))
    constraint.identifier = identifier
    constraint.priority = priority
    return [constraint]
  }
}
