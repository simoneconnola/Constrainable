import Foundation

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing the constraint between the specified anchors, with the supplied options.

  Use this factory when you want to 'pin' different constraints of the same kind, for example:

      pin(.leading, to: .trailing, of: someView)

  - Parameters:
    - xAxisAnchor: The anchor of the supplied Constrainable type.
    - referenceXAxisAnchor: The anchor of the referenced Constrainable type.
    - reference: The referenced Constrainable type.
    - relation: The relation between the supplied anchor and the referenced anchor. The default value is `.equal`.
    - offset: The constant to add to the referenced anchor as part of describing the resulting constraint. The default value is `0`.
    - multiplier: The constant to multiply with the referenced anchor as part of describing the resulting constraint. The default value is `1`.
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func pin(
  _ xAxisAnchor: XAxisAnchor,
  to referenceXAxisAnchor: XAxisAnchor,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return pin(
    xAxisAnchor.keypath,
    to: referenceXAxisAnchor.keypath,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing the constraint between the specified anchors, with the supplied options.

  Use this factory when you want to 'pin' different constraints of the same kind, for example:

      pin(.top, to: .bottom, of: someView)

  - Parameters:
    - yAxisAnchor: The anchor of the supplied Constrainable type.
    - referenceYAxisAnchor: The anchor of the referenced Constrainable type.
    - reference: The referenced Constrainable type.
    - relation: The relation between the supplied anchor and the referenced anchor. The default value is `.equal`.
    - offset: The constant to add to the referenced anchor as part of describing the resulting constraint. The default value is `0`.
    - multiplier: The constant to multiply with the referenced anchor as part of describing the resulting constraint. The default value is `1`.
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func pin(
  _ yAxisAnchor: YAxisAnchor,
  to referenceYAxisAnchor: YAxisAnchor,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return pin(
    yAxisAnchor.keypath,
    to: referenceYAxisAnchor.keypath,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing the constraint between the specified anchors, with the supplied options.

  Use this factory when you want to 'match' different constraints of the same kind, for example:

      match(.width, to: .height, of: someView)

  - Parameters:
    - dimensionAnchor: The anchor of the supplied Constrainable type.
    - referenceDimensionAnchor: The anchor of the referenced Constrainable type.
    - reference: The referenced Constrainable type.
    - relation: The relation between the supplied anchor and the referenced anchor. The default value is `.equal`.
    - offset: The constant to add to the referenced anchor as part of describing the resulting constraint. The default value is `0`.
    - multiplier: The constant to multiply with the referenced anchor as part of describing the resulting constraint. The default value is `1`.
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func match(
  _ dimensionAnchor: DimensionAnchor,
  to referenceDimensionAnchor: DimensionAnchor,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return match(
    dimensionAnchor.keypath,
    to: referenceDimensionAnchor.keypath,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing a constraint matching the specified anchor, with the supplied options.

  Use this factory when you want to 'match' another Constrainable type's anchor, for example:

      match(.leading, of: someView)

  Is the same as:

      pin(.leading, to: .leading, of: someView)


  - Parameters:
    - xAxisAnchor: The anchor to be matched.
    - reference: The referenced Constrainable type.
    - relation: The relation between the supplied anchor and the referenced anchor. The default value is `.equal`
    - offset: The constant to add to the referenced anchor as part of describing the resulting constraint. The default value is `0`.
    - multiplier: The constant to multiply with the referenced anchor as part of describing the resulting constraint. The default value is `1`.
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func match(
  _ xAxisAnchor: XAxisAnchor,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return pin(
    xAxisAnchor,
    to: xAxisAnchor,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing a constraint matching the specified anchor, with the supplied options.

  Use this factory when you want to 'match' another Constrainable type's anchor, for example:

      match(.top, of: someView)

  Is the same as:

      pin(.top, to: .top, of: someView)


  - Parameters:
    - yAxisAnchor: The anchor to be matched.
    - reference: The referenced Constrainable type.
    - relation: The relation between the supplied anchor and the referenced anchor. The default value is `.equal`
    - offset: The constant to add to the referenced anchor as part of describing the resulting constraint. The default value is `0`.
    - multiplier: The constant to multiply with the referenced anchor as part of describing the resulting constraint. The default value is `1`.
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func match(
  _ yAxisAnchor: YAxisAnchor,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return pin(
    yAxisAnchor,
    to: yAxisAnchor,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing a constraint matching the specified anchor, with the supplied options.

  Use this factory when you want to 'match' another Constrainable type's anchor, for example:

      match(.width, of: someView)

  Is the same as:

      match(.width, to: .width, of: someView)


  - Parameters:
    - dimensionAnchor: The anchor to be matched.
    - reference: The referenced Constrainable type.
    - relation: The relation between the supplied anchor and the referenced anchor. The default value is `.equal`
    - offset: The constant to add to the referenced anchor as part of describing the resulting constraint. The default value is `0`.
    - multiplier: The constant to multiply with the referenced anchor as part of describing the resulting constraint. The default value is `1`.
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func match(
  _ dimensionAnchor: DimensionAnchor,
  of reference: Constrainable,
  relation: NSLayoutConstraint.Relation = .equal,
  offset: CGFloat = 0,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return match(
    dimensionAnchor.keypath,
    to: dimensionAnchor.keypath,
    of: reference,
    relation: relation,
    offset: offset,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing a constraint that sets the specified anchor to a constant value, with the supplied options.

  Use this factory when you want to 'set' a constant dimension, for example:

      set(.height, to: 20)

  - Parameters:
    - dimensionAnchor: The dimension anchor to be set.
    - constant: The constant value for the dimension.
    - multiplier: The multiplier for the specified constant. The default value is `1`
    - priority: The priority of the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint.  The default value is `nil`.
*/
@inlinable
public func set(
  _ dimensionAnchor: DimensionAnchor,
  to constant: CGFloat,
  multiplier: CGFloat = 1,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return set(
    dimensionAnchor.keypath,
    to: constant,
    multiplier: multiplier,
    priority: priority,
    identifier: identifier
  )
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing constraints for both width and height, with the supplied options.

  Use this factory when you want to 'set' a constant size (both width and height), for example:

      set(size: CGSize(width: 100, height: 100))

  - Parameters:
    - size: The size for both width and height.
    - heightMultiplier: A multiplier for the height specified in `size`. Takes precedence over `multiplier` if specified. The default value is `nil`.
    - widthMultiplier: A multiplier for the width specified in `size`. Takes precedence over `multiplier` if specified. The default value is `nil`.
    - multiplier:  A multiplier for both width and height specified in `size`.  The default value is `1`.
    - heightPriority: The priority for the height constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - widthPriority: The priority for the width constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - priority: The priority for both height and width constraints.  The default value is `.required`.
    - heightIdentifier: The name that identifies the height constraint. The default value is `nil`.
    - widthIdentifier: The name that identifies the width constraint. The default value is `nil`.
*/
@inlinable
public func set(
  size: CGSize,
  heightMultiplier: CGFloat? = nil,
  widthMultiplier: CGFloat? = nil,
  multiplier: CGFloat = 1,
  heightPriority: UILayoutPriority? = nil,
  widthPriority: UILayoutPriority? = nil,
  priority: UILayoutPriority = .required,
  heightIdentifier: String? = nil,
  widthIdentifier: String? = nil
) -> ConstraintsFactory {
  let heightMultiplier = heightMultiplier ?? multiplier
  let widthMultiplier = widthMultiplier ?? multiplier
  let heightPriority = heightPriority ?? priority
  let widthPriority = widthPriority ?? priority
  return { constrainable in
    return [
      set(
        .width,
        to: size.width,
        multiplier:
        widthMultiplier,
        priority: widthPriority,
        identifier: widthIdentifier
      ),
      set(
        .height,
        to: size.height,
        multiplier: heightMultiplier,
        priority: heightPriority,
        identifier: heightIdentifier
      )
    ]
    .flatMap { $0(constrainable) }
  }
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing a width constraint proportional to its own height, with the supplied options.

  Use this factory when you want to 'set' a constant aspect ratio, for example:

      set(aspectRatio: 16/9)

  - Parameters:
    - aspectRatio: The target aspect ratio.
    - priority: The priority for the resulting constraint.  The default value is `.required`.
    - identifier: The name that identifies the resulting constraint. The default value is `nil`.
*/
@inlinable
public func set(
  aspectRatio ratio: CGFloat,
  priority: UILayoutPriority = .required,
  identifier: String? = nil
) -> ConstraintsFactory {
  return { constrainable in
    match(
      .width,
      to: .height,
      of: constrainable,
      multiplier: ratio,
      priority: priority,
      identifier: identifier
    )(constrainable)
  }
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing constraints for both horizontal and vertical center matching the referenced type,
  with the supplied options.

  Use this factory when you want to 'match' the center of another Constrainable type, for example:

      matchCenter(of: someView)

  - Parameters:
    - reference: The referenced Constrainable type.
    - xOffset: The offset from the reference's horizontal center anchor. The default value is `0`.
    - yOffset: The offset from the reference's vertical center anchor. The default value is `0`.
    - xMultiplier: A multiplier for the reference's horizontal center anchor. The default value is `1`.
    - yMultiplier: A multiplier for the reference's vertical center anchor. The default value is `1`.
    - xPriority: The priority for the horizontal center constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - yPriority: The priority for the vertical center constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - priority: The priority for both horizontal and vertical center constraints.  The default value is `.required`.
    - xIdentifier: The name that identifies the horizontal center constraint. The default value is `nil`.
    - yIdentifier: The name that identifies the vertical center  constraint. The default value is `nil`.
*/
@inlinable
public func matchCenter(
  of reference: Constrainable,
  xOffset: CGFloat = 0,
  yOffset: CGFloat = 0,
  xMultiplier: CGFloat = 1,
  yMultiplier: CGFloat = 1,
  xPriority: UILayoutPriority? = nil,
  yPriority: UILayoutPriority? = nil,
  priority: UILayoutPriority = .required,
  xIdentifier: String? = nil,
  yIdentifier: String? = nil
) -> ConstraintsFactory {
  return { constrainable in
    let horizontalPriority = xPriority ?? priority
    let verticalPriority = yPriority ?? priority
    return [
      match(
        .centerX,
        of: reference,
        offset: xOffset,
        multiplier: xMultiplier,
        priority: horizontalPriority,
        identifier: xIdentifier
      ),
      match(
        .centerY,
        of: reference,
        offset: yOffset,
        multiplier: yMultiplier,
        priority: verticalPriority,
        identifier: yIdentifier
      ),
    ]
    .flatMap { $0(constrainable) }
  }
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing constraints for both width and height matching the referenced type,
  with the supplied options.

  Use this factory when you want to 'match' the size of another Constrainable type, for example:

      matchSize(of: someView)

  - Parameters:
    - reference: The referenced Constrainable type.
    - heightRelation: The relation between the height anchors. Takes precedence over `relation` if specified.The default value is `nil`
    - widthRelation: The relation between the height anchors. Takes precedence over `relation` if specified. The default value is `nil`
    - relation: The relation between both width and height anchors. The default value is `.equal`
    - heightMultiplier: A multiplier for the height specified in `size`. Takes precedence over `multiplier` if specified. The default value is `nil`.
    - widthMultiplier: A multiplier for the width specified in `size`. Takes precedence over `multiplier` if specified. The default value is `nil`.
    - multiplier:  A multiplier for both width and height specified in `size`.  The default value is `1`.
    - heightPriority: The priority for the height constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - widthPriority: The priority for the width constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - priority: The priority for both height and width constraints.  The default value is `.required`.
    - heightIdentifier: The name that identifies the height constraint. The default value is `nil`.
    - widthIdentifier: The name that identifies the width constraint. The default value is `nil`.
*/
@inlinable
public func matchSize(
  of reference: Constrainable,
  heightRelation: NSLayoutConstraint.Relation? = nil,
  widthRelation: NSLayoutConstraint.Relation? = nil,
  relation: NSLayoutConstraint.Relation = .equal,
  heightMultiplier: CGFloat?,
  widthMultiplier: CGFloat?,
  multiplier: CGFloat = 1,
  heightPriority: UILayoutPriority? = nil,
  widthPriority: UILayoutPriority? = nil,
  priority: UILayoutPriority = .required,
  heightIdentifier: String? = nil,
  widthIdentifier: String? = nil
) -> ConstraintsFactory {
  let heightRelation = heightRelation ?? relation
  let widthRelation = widthRelation ?? relation
  let heightMultiplier = heightMultiplier ?? multiplier
  let widthMultiplier = widthMultiplier ?? multiplier
  let heightPriority = heightPriority ?? priority
  let widthPriority = widthPriority ?? priority
  return { constrainable in
    return [
      match(
        .width,
        of: reference,
        relation: widthRelation,
        multiplier: widthMultiplier,
        priority: widthPriority,
        identifier: widthIdentifier
      ),
      match(
        .height,
        of: reference,
        relation: heightRelation,
        multiplier: heightMultiplier,
        priority: heightPriority,
        identifier: heightIdentifier
      )
    ]
    .flatMap { $0(constrainable) }
  }
}

/**
  Returns a constraints factory that given a Constrainable type will generate an array
  containing constraints for top, bottom, leading and trailing anchors matching the referenced type,
  with the supplied options.

  Use this factory when you want to 'match' all the edges (top, bottom, leading, trailing) of another Constrainable type, for example:

      matchEdges(of: someView)

  - Parameters:
    - reference: The referenced Constrainable type.
    - insets: The insets used to calculate offset from top, leading, trailing and bottom anchors. The default value is `.zero`.
    - topPriority: The priority for the top constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - bottomPriority: The priority for the bottom constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - leadingPriority: The priority for the leading constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - trailingPriority: The priority for the trailing constraint. Takes precedence over `priority` if specified. The default value is `nil`.
    - priority: The priority for all edges constraints.  The default value is `.required`.
    - topIdentifier: The name that identifies the top constraint. The default value is `nil`.
    - bottomIdentifier: The name that identifies the bottom constraint. The default value is `nil`.
    - leadingIdentifier: The name that identifies the leading constraint. The default value is `nil`.
    - trailingIdentifier: The name that identifies the trailing constraint. The default value is `nil`.
*/
@inlinable
public func matchEdges(
  of reference: Constrainable,
  with insets: UIEdgeInsets = .zero,
  topPriority: UILayoutPriority? = nil,
  bottomPriority: UILayoutPriority? = nil,
  leadingPriority: UILayoutPriority? = nil,
  trailingPriority: UILayoutPriority? = nil,
  priority: UILayoutPriority = .required,
  topIdentifier: String? = nil,
  bottomIdentifier: String? = nil,
  leadingIdentifier: String? = nil,
  trailingIdentifier: String? = nil
) -> ConstraintsFactory {
  let topPriority = topPriority ?? priority
  let bottomPriority = bottomPriority ?? priority
  let leadingPriority = leadingPriority ?? priority
  let trailingPriority = trailingPriority ?? priority
  return { constrainable  in
    return [
      match(.top, of: reference, offset: insets.top, priority: topPriority, identifier: topIdentifier),
      match(.bottom, of: reference, offset: -insets.bottom, priority: bottomPriority, identifier: bottomIdentifier),
      match(.leading, of: reference, offset: insets.left, priority: leadingPriority, identifier: leadingIdentifier),
      match(.trailing, of: reference, offset: -insets.right, priority: trailingPriority, identifier: trailingIdentifier)
    ]
    .flatMap{ $0(constrainable) }
  }
}
