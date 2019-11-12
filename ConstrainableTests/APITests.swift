
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

  func testSetBothDimensions_DefaultOptions() {

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

  func testSetBothDimensions_CustomOptions() {

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

  func testSetBothDimensions_HeightMultiplierPrecedence() {
    let size = CGSize(width: 1, height: 1)
    let constraints = set(size: size, heightMultiplier: 100, multiplier: 10)(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.constant, 10)
    XCTAssertEqual(heightConstraint.constant, 100)
  }

  func testSetBothDimensions_WidthMultiplierPrecedence() {
    let size = CGSize(width: 1, height: 1)
    let constraints = set(size: size, widthMultiplier: 100, multiplier: 10)(view1)

    let widthConstraint = constraints[0]
    let heightConstraint = constraints[1]

    XCTAssertEqual(widthConstraint.constant, 100)
    XCTAssertEqual(heightConstraint.constant, 10)
  }

  func testSetBothDimensions_BothMultipliersPrecedence() {
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
