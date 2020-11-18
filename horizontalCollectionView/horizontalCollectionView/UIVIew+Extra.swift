//
//  UIVIew+Extra.swift
//  horizontalCollectionView
//
//  Created by venvehuob on 18/11/20.
//  Copyright © 2020 vermamukesh. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func fromNib<T: UIView>(nibName: String, isInherited: Bool = false) -> T? {
        let bundle = Bundle(for: type(of: self))
        guard let contentView =  bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }
        contentView.backgroundColor = .clear
        if isInherited {
            self.insertSubview(contentView, at: 0)
        } else {
            self.addSubview(contentView)
        }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.fixConstraintsInView(self)
        return contentView
    }
    func fixConstraintsInView(_ container: UIView!) {
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    func fillToSuperView(margin: UIEdgeInsets = UIEdgeInsets.zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let viewSuperView = self.superview {
            self.topAnchor.constraint(equalTo: viewSuperView.topAnchor, constant: margin.top).isActive = true
            self.bottomAnchor.constraint(equalTo: viewSuperView.bottomAnchor, constant: margin.bottom).isActive = true
            self.leadingAnchor.constraint(equalTo: viewSuperView.leadingAnchor, constant: margin.left).isActive = true
            self.trailingAnchor.constraint(equalTo: viewSuperView.trailingAnchor, constant: -margin.right).isActive = true
        }
    }
    // check height constraint on view
    var heightConstaint: NSLayoutConstraint? {
       return constraints.first(where: {
            $0.firstAttribute == .height && $0.relation == .equal
      })
    }
    // check leading constraint on view
    var leadingConstaint: NSLayoutConstraint? {
        return constraints.first(where: {
            $0.firstAttribute == .leading && $0.relation == .equal
        })
    }
    // check trailing constraint on view
    var trailingConstaint: NSLayoutConstraint? {
        return constraints.first(where: {
            $0.firstAttribute == .trailing && $0.relation == .equal
        })
    }
    // check width constraint on view
    var widthConstaint: NSLayoutConstraint? {
        return constraints.first(where: {
            $0.firstAttribute == .width && $0.relation == .equal
        })
    }
}

