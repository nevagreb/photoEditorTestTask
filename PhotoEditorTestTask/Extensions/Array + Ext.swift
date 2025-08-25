//
//  Array + Ext.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 25.08.2025.
//

import UIKit

extension Array where Element: UIView {
    func translatesAutoresizingMaskIntoConstraints() {
        self.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
