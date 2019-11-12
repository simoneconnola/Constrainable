
import XCTest
@testable import Constrainable

class ConstrainableUIVIewTests: XCTestCase {

  var view: UIView!

  override func setUp() {
    view = UIView()
  }

  // MARK: - makeConstraints

  func testMakeConstraintsOnUIViewGeneratesAnArrayOfInactiveConstraints() {
    
    let constant: CGFloat = 10

      let expectedConstraints = [
        view.widthAnchor.constraint(equalToConstant: constant),
        view.heightAnchor.constraint(equalToConstant: constant),
      ]
      let variadic = view.makeConstraints(
        set(.width, to: constant),
        set(.height, to: constant)
      )
      let array = view.makeConstraints([
        set(.width, to: constant),
        set(.height, to: constant),
      ])

      XCTAssertTrue(testEquivalence(expectedConstraints, variadic))
      XCTAssertTrue(testEquivalence(expectedConstraints, array))
      XCTAssertTrue(testAllInactive(variadic))
      XCTAssertTrue(testAllInactive(array))
  }

  func testMakeConstraintsOnUIViewSetsTheAutoresizingaMaskTransaltionToFalse() {
    _ = view.makeConstraints([])
    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
  }

  func testVariadicMakeConstraintsOnUIViewSetsTheAutoresizingaMaskTransaltionToFalse() {
    _ = view.makeConstraints()
    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
  }

  // MARK: - constrain

  func testConstrainOnUIViewGeneratesAnArrayOfActiveConstraints() {
    let constant: CGFloat = 10

    let expectedConstraints = [
      view.widthAnchor.constraint(equalToConstant: constant),
      view.heightAnchor.constraint(equalToConstant: constant),
    ]
    NSLayoutConstraint.activate(expectedConstraints)

    let variadic = view.constrain(
      set(.width, to: constant),
      set(.height, to: constant)
    )
    let array = view.constrain([
      set(.width, to: constant),
      set(.height, to: constant),
    ])

    XCTAssertTrue(testEquivalence(expectedConstraints, variadic))
    XCTAssertTrue(testEquivalence(expectedConstraints, array))
    XCTAssertTrue(testAllActive(variadic))
    XCTAssertTrue(testAllActive(array))
  }

  func testConstrainOnUIViewSetsTheAutoresizingaMaskTransaltionToFalse() {
    _ = view.constrain([])
    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
  }

  func testVariadicConstrainOnUIViewSetsTheAutoresizingaMaskTransaltionToFalse() {
    _ = view.constrain()
    XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
  }
}
