
import XCTest
@testable import Constrainable

class APITests: XCTestCase {

  var view1: UIView!
  var view2: UIView!

  let standardCustomOptions = CustomOptions()

  override func setUp() {
    view1 = UIView()
    view2 = UIView()
  }

  // MARK: - Pin Horizontal Axis

  func testPinXAxis_DefaultOptions() {
    let constraints = pin(.top, to: .bottom, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .bottom)
    assertHasDefaultOptions(constraint)
  }

  func testPinXAxis_CustomOptions() {
    let constraints = pin(
      .top,
      to: .bottom,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .bottom)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Pin Vertical Axis

  func testPinYAxis_DefaultOptions() {
    let constraints = pin(.leading, to: .trailing, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .trailing)
    assertHasDefaultOptions(constraint)
  }

  func testPinYAxis_CustomOptions() {
    let constraints = pin(
      .leading,
      to: .trailing,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .trailing)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Match Dimensions

  func testMatchDimension_DefaultOptions() {
    let constraints = match(.width, to: .height, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    assertHasDefaultOptions(constraint)
  }

  func testMatchDimension_CustomOptions() {
    let constraints = match(
      .width,
      to: .height,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Match Horizontal

  func testMatchXAxis_DefaultOptions() {
    let constraints = match(.leading, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .leading)
    assertHasDefaultOptions(constraint)
  }

  func testMatchXAxis_CustomOptions() {
    let constraints = match(
      .leading,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .leading)
    XCTAssert(constraint.secondAttribute == .leading)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Match Vertical

  func testMatchYAxis_DefaultOptions() {
    let constraints = match(.top, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .top)
    assertHasDefaultOptions(constraint)
  }

  func testMatchYAxis_CustomOptions() {
    let constraints = match(
      .top,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .top)
    XCTAssert(constraint.secondAttribute == .top)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Match Same Dimension

  func testMatchSameDimension_DefaultOptions() {
    let constraints = match(.width, of: view2)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .width)
    assertHasDefaultOptions(constraint)
  }

  func testMatchSameDimension_CustomOptions() {
    let constraints = match(
      .width,
      of: view2,
      relation: standardCustomOptions.relation,
      offset: standardCustomOptions.offset,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
    )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view2)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .width)
    assertHasCustomOptions(constraint)
  }

  // MARK: - Set Single Dimension

  func testSetDimension_DefaultOptions() {
    let constraints = set(.width, to: 10)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssertNil(constraint.secondItem)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .notAnAttribute)
    XCTAssertEqual(constraint.constant, 10)
    XCTAssertEqual(constraint.multiplier, 1)
    XCTAssertEqual(constraint.priority, .required)
    XCTAssertNil(constraint.identifier)
  }

  func testSetDimension_CustomOptions() {
    let constraints = set(
      .width,
      to: 10,
      multiplier: 10,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
      )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssertNil(constraint.secondItem)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .notAnAttribute)
    XCTAssertEqual(constraint.constant, 100)
    XCTAssertEqual(constraint.multiplier, 1)
    XCTAssertEqual(constraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(constraint.identifier, standardCustomOptions.identifier)
  }

  // MARK: - Set Size

  func testSetSize_DefaultOptions() {

    let size = CGSize(width: 10, height: 10)
    let constraints = set(size: size)(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertTrue(constraints.count == 2)

    XCTAssert(heightConstraint.firstItem === view1)
    XCTAssertNil(heightConstraint.secondItem)
    XCTAssert(heightConstraint.firstAttribute == .height)
    XCTAssert(heightConstraint.secondAttribute == .notAnAttribute)
    XCTAssertEqual(heightConstraint.constant, 10)
    XCTAssertEqual(heightConstraint.multiplier, 1)
    XCTAssertEqual(heightConstraint.priority, .required)
    XCTAssertNil(heightConstraint.identifier)

    XCTAssert(widthConstraint.firstItem === view1)
    XCTAssertNil(widthConstraint.secondItem)
    XCTAssert(widthConstraint.firstAttribute == .width)
    XCTAssert(widthConstraint.secondAttribute == .notAnAttribute)
    XCTAssertEqual(widthConstraint.constant, 10)
    XCTAssertEqual(widthConstraint.multiplier, 1)
    XCTAssertEqual(widthConstraint.priority, .required)
    XCTAssertNil(widthConstraint.identifier)
  }

  func testSetSize_CustomOptions() {

    let size = CGSize(width: 10, height: 10)
    let constraints = set(
      size: size,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      heightIdentifier: "height",
      widthIdentifier: "width"
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertTrue(constraints.count == 2)

    XCTAssert(heightConstraint.firstItem === view1)
    XCTAssertNil(heightConstraint.secondItem)
    XCTAssert(heightConstraint.firstAttribute == .height)
    XCTAssert(heightConstraint.secondAttribute == .notAnAttribute)
    XCTAssertEqual(heightConstraint.constant, 10 * standardCustomOptions.multiplier)
    XCTAssertEqual(heightConstraint.multiplier, 1)
    XCTAssertEqual(heightConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(heightConstraint.identifier, "height")

    XCTAssert(widthConstraint.firstItem === view1)
    XCTAssertNil(widthConstraint.secondItem)
    XCTAssert(widthConstraint.firstAttribute == .width)
    XCTAssert(widthConstraint.secondAttribute == .notAnAttribute)
    XCTAssertEqual(widthConstraint.constant, 10 * standardCustomOptions.multiplier)
    XCTAssertEqual(widthConstraint.multiplier, 1)
    XCTAssertEqual(widthConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(widthConstraint.identifier, "width")
  }

  func testSetSize_MultipliersPrecedence() {
    let size = CGSize(width: 1, height: 1)
    let constraints = set(
      size: size,
      heightMultiplier: 22,
      widthMultiplier: 11,
      multiplier: 10000
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.constant, 11)
    XCTAssertEqual(heightConstraint.constant, 22)
  }

  func testSetSize_PrioritiesPrecedence() {
    let size = CGSize(width: 1, height: 1)
    let constraints = set(
      size: size,
      heightPriority: .defaultHigh,
      widthPriority: .defaultLow,
      priority: .required
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.priority, .defaultLow)
    XCTAssertEqual(heightConstraint.priority, .defaultHigh)
  }

  // MARK: - Aspect Ratio

  func testSetAspectRatio_DefaultOptions() {
    let constraints = set(aspectRatio: 0.5)(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view1)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    XCTAssertEqual(constraint.constant, 0)
    XCTAssertEqual(constraint.multiplier, 0.5)
    XCTAssertEqual(constraint.priority, .required)
    XCTAssertNil(constraint.identifier)
  }

  func testAspectRatio_CustomOptions() {
    let constraints = set(
      aspectRatio: 0.5,
      priority: standardCustomOptions.priority,
      identifier: standardCustomOptions.identifier
      )(view1)
    let constraint = constraints.first!
    XCTAssertTrue(constraints.count == 1)
    XCTAssert(constraint.firstItem === view1)
    XCTAssert(constraint.secondItem === view1)
    XCTAssert(constraint.firstAttribute == .width)
    XCTAssert(constraint.secondAttribute == .height)
    XCTAssertEqual(constraint.constant, 0)
    XCTAssertEqual(constraint.multiplier, 0.5)
    XCTAssertEqual(constraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(constraint.identifier, standardCustomOptions.identifier)
  }

  // MARK: - Match Center

  func testMatchCenter_DefaultOptions() {

    let constraints = matchCenter(of: view2)(view1)

    let horizontalConstraint = constraints[0]
    let verticalConstraint = constraints[1]

    XCTAssertTrue(constraints.count == 2)

    XCTAssert(verticalConstraint.firstItem === view1)
    XCTAssert(verticalConstraint.secondItem === view2)
    XCTAssert(verticalConstraint.firstAttribute == .centerY)
    XCTAssert(verticalConstraint.secondAttribute == .centerY)
    XCTAssertEqual(verticalConstraint.constant, 0)
    XCTAssertEqual(verticalConstraint.multiplier, 1)
    XCTAssertEqual(verticalConstraint.priority, .required)
    XCTAssertNil(verticalConstraint.identifier)

    XCTAssert(horizontalConstraint.firstItem === view1)
    XCTAssert(horizontalConstraint.secondItem === view2)
    XCTAssert(horizontalConstraint.firstAttribute == .centerX)
    XCTAssert(horizontalConstraint.secondAttribute == .centerX)
    XCTAssertEqual(horizontalConstraint.constant, 0)
    XCTAssertEqual(horizontalConstraint.multiplier, 1)
    XCTAssertEqual(horizontalConstraint.priority, .required)
    XCTAssertNil(horizontalConstraint.identifier)
  }

  func testMatchCenter_CustomOptions() {

    let constraints = matchCenter(
      of: view2,
      xOffset: standardCustomOptions.offset,
      yOffset: standardCustomOptions.offset,
      xMultiplier: standardCustomOptions.multiplier,
      yMultiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      xIdentifier: "horizontal",
      yIdentifier: "vertical"
    )(view1)

    let horizontalConstraint = constraints[0]
    let verticalConstraint = constraints[1]

    XCTAssertTrue(constraints.count == 2)

    XCTAssert(verticalConstraint.firstItem === view1)
    XCTAssert(verticalConstraint.secondItem === view2)
    XCTAssert(verticalConstraint.firstAttribute == .centerY)
    XCTAssert(verticalConstraint.secondAttribute == .centerY)
    XCTAssertEqual(verticalConstraint.constant, standardCustomOptions.offset)
    XCTAssertEqual(verticalConstraint.multiplier, standardCustomOptions.multiplier)
    XCTAssertEqual(verticalConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(verticalConstraint.identifier, "vertical")

    XCTAssert(horizontalConstraint.firstItem === view1)
    XCTAssert(horizontalConstraint.secondItem === view2)
    XCTAssert(horizontalConstraint.firstAttribute == .centerX)
    XCTAssert(horizontalConstraint.secondAttribute == .centerX)
    XCTAssertEqual(horizontalConstraint.constant, standardCustomOptions.offset)
    XCTAssertEqual(horizontalConstraint.multiplier, standardCustomOptions.multiplier)
    XCTAssertEqual(horizontalConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(horizontalConstraint.identifier, "horizontal")
  }

  func testMatchCenter_PrioritiesPrecedence() {
    let constraints = matchCenter(
      of: view2,
      xPriority: .defaultHigh,
      yPriority: .defaultLow,
      priority: .required
    )(view1)

    let horizontalConstraint = constraints[0]
    let verticalConstraint = constraints[1]

    XCTAssertEqual(horizontalConstraint.priority, .defaultHigh)
    XCTAssertEqual(verticalConstraint.priority, .defaultLow)
  }

  // MARK: - Match Size

  func testMatchSize_DefaultOptions() {

    let constraints = matchSize(of: view2)(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertTrue(constraints.count == 2)

    XCTAssert(heightConstraint.firstItem === view1)
    XCTAssert(heightConstraint.secondItem === view2)
    XCTAssert(heightConstraint.firstAttribute == .height)
    XCTAssert(heightConstraint.secondAttribute == .height)
    XCTAssertEqual(heightConstraint.constant, 0)
    XCTAssertEqual(heightConstraint.multiplier, 1)
    XCTAssertEqual(heightConstraint.priority, .required)
    XCTAssertNil(heightConstraint.identifier)

    XCTAssert(widthConstraint.firstItem === view1)
    XCTAssert(widthConstraint.secondItem === view2)
    XCTAssert(widthConstraint.firstAttribute == .width)
    XCTAssert(widthConstraint.secondAttribute == .width)
    XCTAssertEqual(widthConstraint.constant, 0)
    XCTAssertEqual(widthConstraint.multiplier, 1)
    XCTAssertEqual(widthConstraint.priority, .required)
    XCTAssertNil(widthConstraint.identifier)
  }

  func testMatchSize_CustomOptions() {

    let constraints = matchSize(
      of: view2,
      relation: standardCustomOptions.relation,
      multiplier: standardCustomOptions.multiplier,
      priority: standardCustomOptions.priority,
      heightIdentifier: "height",
      widthIdentifier: "width"
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertTrue(constraints.count == 2)

    XCTAssert(heightConstraint.firstItem === view1)
    XCTAssert(heightConstraint.secondItem === view2)
    XCTAssert(heightConstraint.firstAttribute == .height)
    XCTAssert(heightConstraint.secondAttribute == .height)
    XCTAssertEqual(heightConstraint.constant, 0)
    XCTAssertEqual(heightConstraint.multiplier, standardCustomOptions.multiplier)
    XCTAssertEqual(heightConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(heightConstraint.identifier, "height")

    XCTAssert(widthConstraint.firstItem === view1)
    XCTAssert(widthConstraint.secondItem === view2)
    XCTAssert(widthConstraint.firstAttribute == .width)
    XCTAssert(widthConstraint.secondAttribute == .width)
    XCTAssertEqual(widthConstraint.constant, 0)
    XCTAssertEqual(widthConstraint.multiplier, standardCustomOptions.multiplier)
    XCTAssertEqual(widthConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(widthConstraint.identifier, "width")
  }

  func testMatchSize_RelationsPrecedence() {
    let constraints = matchSize(
      of: view2,
      heightRelation: .greaterThanOrEqual,
      widthRelation: .lessThanOrEqual,
      relation: .equal
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.relation, .lessThanOrEqual)
    XCTAssertEqual(heightConstraint.relation, .greaterThanOrEqual)
  }

  func testMatchSize_MultipliersPrecedence() {
    let constraints = matchSize(
      of: view2,
      heightMultiplier: 22,
      widthMultiplier: 11,
      multiplier: 10000
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.multiplier, 11)
    XCTAssertEqual(heightConstraint.multiplier, 22)
  }

  func testMatchSize_PrioritiesPrecedence() {
    let constraints = matchSize(
      of: view2,
      heightPriority: .defaultHigh,
      widthPriority: .defaultLow,
      priority: .required
    )(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.priority, .defaultLow)
    XCTAssertEqual(heightConstraint.priority, .defaultHigh)
  }

  // MARK: - Match Edges

  func testMatchEdges_DefaultOptions() {

    let constraints = matchEdges(of: view2)(view1)

    let topConstraint = constraints[0]
    let bottomConstraint = constraints[1]
    let leadingConstraint = constraints[2]
    let trailingConstraint = constraints[3]

    XCTAssertTrue(constraints.count == 4)

    XCTAssert(topConstraint.firstItem === view1)
    XCTAssert(topConstraint.secondItem === view2)
    XCTAssert(topConstraint.firstAttribute == .top)
    XCTAssert(topConstraint.secondAttribute == .top)
    XCTAssertEqual(topConstraint.constant, 0)
    XCTAssertEqual(topConstraint.multiplier, 1)
    XCTAssertEqual(topConstraint.priority, .required)
    XCTAssertNil(topConstraint.identifier)

    XCTAssert(bottomConstraint.firstItem === view1)
    XCTAssert(bottomConstraint.secondItem === view2)
    XCTAssert(bottomConstraint.firstAttribute == .bottom)
    XCTAssert(bottomConstraint.secondAttribute == .bottom)
    XCTAssertEqual(bottomConstraint.constant, 0)
    XCTAssertEqual(bottomConstraint.multiplier, 1)
    XCTAssertEqual(bottomConstraint.priority, .required)
    XCTAssertNil(bottomConstraint.identifier)

    XCTAssert(leadingConstraint.firstItem === view1)
    XCTAssert(leadingConstraint.secondItem === view2)
    XCTAssert(leadingConstraint.firstAttribute == .leading)
    XCTAssert(leadingConstraint.secondAttribute == .leading)
    XCTAssertEqual(leadingConstraint.constant, 0)
    XCTAssertEqual(leadingConstraint.multiplier, 1)
    XCTAssertEqual(leadingConstraint.priority, .required)
    XCTAssertNil(leadingConstraint.identifier)

    XCTAssert(trailingConstraint.firstItem === view1)
    XCTAssert(trailingConstraint.secondItem === view2)
    XCTAssert(trailingConstraint.firstAttribute == .trailing)
    XCTAssert(trailingConstraint.secondAttribute == .trailing)
    XCTAssertEqual(trailingConstraint.constant, 0)
    XCTAssertEqual(trailingConstraint.multiplier, 1)
    XCTAssertEqual(trailingConstraint.priority, .required)
    XCTAssertNil(trailingConstraint.identifier)
  }

  func testMatchEdges_CustomOptions() {

    let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    let constraints = matchEdges(
      of: view2,
      insets: insets,
      priority: standardCustomOptions.priority,
      topIdentifier: "top",
      bottomIdentifier: "bottom",
      leadingIdentifier: "leading",
      trailingIdentifier: "trailing"
    )(view1)

    let topConstraint = constraints[0]
    let bottomConstraint = constraints[1]
    let leadingConstraint = constraints[2]
    let trailingConstraint = constraints[3]

    XCTAssertTrue(constraints.count == 4)

    XCTAssert(topConstraint.firstItem === view1)
    XCTAssert(topConstraint.secondItem === view2)
    XCTAssert(topConstraint.firstAttribute == .top)
    XCTAssert(topConstraint.secondAttribute == .top)
    XCTAssertEqual(topConstraint.constant, insets.top)
    XCTAssertEqual(topConstraint.multiplier, 1)
    XCTAssertEqual(topConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(topConstraint.identifier, "top")

    XCTAssert(bottomConstraint.firstItem === view1)
    XCTAssert(bottomConstraint.secondItem === view2)
    XCTAssert(bottomConstraint.firstAttribute == .bottom)
    XCTAssert(bottomConstraint.secondAttribute == .bottom)
    XCTAssertEqual(bottomConstraint.constant, -insets.bottom)
    XCTAssertEqual(bottomConstraint.multiplier, 1)
    XCTAssertEqual(bottomConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(bottomConstraint.identifier, "bottom")

    XCTAssert(leadingConstraint.firstItem === view1)
    XCTAssert(leadingConstraint.secondItem === view2)
    XCTAssert(leadingConstraint.firstAttribute == .leading)
    XCTAssert(leadingConstraint.secondAttribute == .leading)
    XCTAssertEqual(leadingConstraint.constant, insets.left)
    XCTAssertEqual(leadingConstraint.multiplier, 1)
    XCTAssertEqual(leadingConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(leadingConstraint.identifier, "leading")

    XCTAssert(trailingConstraint.firstItem === view1)
    XCTAssert(trailingConstraint.secondItem === view2)
    XCTAssert(trailingConstraint.firstAttribute == .trailing)
    XCTAssert(trailingConstraint.secondAttribute == .trailing)
    XCTAssertEqual(trailingConstraint.constant, -insets.right)
    XCTAssertEqual(trailingConstraint.multiplier, 1)
    XCTAssertEqual(trailingConstraint.priority, standardCustomOptions.priority)
    XCTAssertEqual(trailingConstraint.identifier, "trailing")
  }

  func testMatchEdges_PrioritiesPrecedence() {
    let constraints = matchEdges(
      of: view2,
      topPriority: .defaultHigh,
      bottomPriority: .defaultLow,
      leadingPriority: .fittingSizeLevel,
      trailingPriority: .dragThatCannotResizeScene,
      priority: .required
    )(view1)

    let topConstraint = constraints[0]
    let bottomConstraint = constraints[1]
    let leadingConstraint = constraints[2]
    let trailingConstraint = constraints[3]

    XCTAssertEqual(topConstraint.priority, .defaultHigh)
    XCTAssertEqual(bottomConstraint.priority, .defaultLow)
    XCTAssertEqual(leadingConstraint.priority, .fittingSizeLevel)
    XCTAssertEqual(trailingConstraint.priority, .dragThatCannotResizeScene)
  }
}

extension APITests {

  struct CustomOptions {
    var relation: NSLayoutConstraint.Relation = .lessThanOrEqual
    var offset: CGFloat = 10
    var multiplier: CGFloat = 10
    var priority: UILayoutPriority = .defaultHigh
    var identifier: String? = "someIdentifier"
  }

  func assertHasDefaultOptions(_ constraint: NSLayoutConstraint) {
    XCTAssertEqual(constraint.relation, .equal)
    XCTAssertEqual(constraint.constant, 0)
    XCTAssertEqual(constraint.multiplier, 1)
    XCTAssertEqual(constraint.priority, .required)
    XCTAssertEqual(constraint.identifier, nil)
  }

  func assertHasCustomOptions(_ constraint: NSLayoutConstraint, options: CustomOptions = CustomOptions()) {
    XCTAssertEqual(constraint.relation, options.relation)
    XCTAssertEqual(constraint.constant, options.offset)
    XCTAssertEqual(constraint.multiplier, options.multiplier)
    XCTAssertEqual(constraint.priority, options.priority)
    XCTAssertEqual(constraint.identifier, options.identifier)
  }
}
