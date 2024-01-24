//
//  UITextField+Ext.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 23/01/24.
//

import UIKit

extension UITextField {
    func setRightIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 13, width: 16, height: 16))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: -8, y: 0, width: 40, height: 40))
       iconContainerView.addSubview(iconView)
       rightView = iconContainerView
       rightViewMode = .always
    }
}
