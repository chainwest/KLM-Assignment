//
//  FontProviderTest.swift
//  KLM AssignmentTests
//
//  Created by Евгений Урбановский on 5/7/23.
//

import UIKit.UIFont
import XCTest
@testable import KLM_Assignment

final class FontProviderTests: XCTestCase {
    func testHeaderBoldFont() {
        let headerBoldFont = FontProvider.headerBold
        XCTAssertEqual(headerBoldFont.fontDescriptor.symbolicTraits, UIFontDescriptor.SymbolicTraits.traitBold)
        XCTAssertEqual(headerBoldFont.pointSize, 32)
    }

    func test_title_bold_font() {
        let titleBoldFont = FontProvider.titleBold
        XCTAssertEqual(titleBoldFont.fontDescriptor.symbolicTraits, UIFontDescriptor.SymbolicTraits.traitBold)
        XCTAssertEqual(titleBoldFont.pointSize, 24)
    }

    func test_body_medium_font() {
        let bodyMediumFont = FontProvider.bodyMedium
        XCTAssertEqual(bodyMediumFont.fontDescriptor.symbolicTraits, UIFontDescriptor.SymbolicTraits())
        XCTAssertEqual(bodyMediumFont.pointSize, 16)
    }

    func test_medium_font() {
        let mediumFont = FontProvider.medium(size: 18)
        XCTAssertEqual(mediumFont.fontDescriptor.symbolicTraits, UIFontDescriptor.SymbolicTraits())
        XCTAssertEqual(mediumFont.pointSize, 18)
    }

    func test_regular_font() {
        let regularFont = FontProvider.regular(size: 18)
        XCTAssertEqual(regularFont.fontDescriptor.symbolicTraits, UIFontDescriptor.SymbolicTraits())
        XCTAssertEqual(regularFont.pointSize, 18)
    }


    func test_bold_font() {
        let boldFont = FontProvider.bold(size: 18)
        XCTAssertEqual(boldFont.fontDescriptor.symbolicTraits, UIFontDescriptor.SymbolicTraits.traitBold)
        XCTAssertEqual(boldFont.pointSize, 18)
    }
}

