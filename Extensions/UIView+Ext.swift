//
//  UIView+Ext.swift
//  SetGraph
//
//  Created by Janvi Arora on 24/08/24.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
