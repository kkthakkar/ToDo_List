//
//  Extensions.swift
//  To-Do List
//
//  Created by Kishan Thakkar on 30/05/23.
//

import Foundation
import UIKit

extension UILabel {

func strikeThrough(_ isStrikeThrough:Bool) {
    if isStrikeThrough {
        if let lblText = self.text {
            let attributeString =  NSMutableAttributedString(string: lblText)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
            self.attributedText = attributeString
        }
    } else {
        
        if let attributedStringText = self.attributedText {
            let txt = attributedStringText.string
            self.attributedText = nil
            self.text = txt
            return
        }
    }
    }
}
