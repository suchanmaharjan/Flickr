//
//  HeightWidthExtractionTest.swift
//  FlickrTests
//
//  Created by SUCHAN MAHARJAN on 27/09/2024.
//

import XCTest
@testable import Flickr

final class WidthHeightExtractionTest: XCTestCase {
    let validHtmlString = "<p><a href=\"https://www.flickr.com/people/red-n-white/\">Bertram Ernest</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/red-n-white/54024865381/\" title=\"Queen Elizabeth&#039;s Hunting Lodge\"><img src=\"https://live.staticflickr.com/65535/54024865381_792224cf3e_m.jpg\" width=\"240\" height=\"181\" alt=\"Queen Elizabeth&#039;s Hunting Lodge\" /></a></p> "
    
    let invalidHtmlString = "<p><a href=\"https://www.flickr.com/people/red-n-white/\">Bertram Ernest</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/red-n-white/54024865381/\" title=\"Queen Elizabeth&#039;s Hunting Lodge\"><img src=\"https://live.staticflickr.com/65535/54024865381_792224cf3e_m.jpg\" alt=\"Queen Elizabeth&#039;s Hunting Lodge\" /></a></p> "

    func testStringContainWidthHeight() {
        let detailViewModel = DetailViewModel()
        let result = detailViewModel.extractDimensions(from: validHtmlString)
        
        let expectedResult : (Int?, Int?) = (240, 181)
        XCTAssertEqual(result.width, expectedResult.0)
        XCTAssertEqual(result.height, expectedResult.1)
    }

    func testStringWithoutHeightWidth() {
        let detailViewModel = DetailViewModel()
        let result = detailViewModel.extractDimensions(from: invalidHtmlString)
        
        let expectedResult : (Int?, Int?) = (nil, nil)
        XCTAssertEqual(result.width, expectedResult.0)
        XCTAssertEqual(result.height, expectedResult.1)
    }

}
