//
//  AppExtensions.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import Foundation
import SwiftUI



extension String {
    func htmlAttributedString() -> NSMutableAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else { return nil }
        return html
    }
}
