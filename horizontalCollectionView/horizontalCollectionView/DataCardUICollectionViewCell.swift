//
//  FundCardUICollectionViewCell.swift
//  KitchenSink
//
//  Created by venvehuob on 12/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
class DataCardUICollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var fundCardView: DataCardView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = .clear
        self.backgroundColor = .clear
    }
    func setupUI(fundModel: CardModel) {
        fundCardView.label = fundModel.label
        fundCardView.title = fundModel.title
        fundCardView.leftLabel = fundModel.leftLabel
        fundCardView.leftTitle = fundModel.leftTitle
        fundCardView.rightLabel = fundModel.rightLabel
        fundCardView.rightTitle = fundModel.rightTitle
        fundCardView.footerLabel = fundModel.footerLabel
        fundCardView.footerTitle = fundModel.footerTitle
        fundCardView.footerImage = fundModel.footerImage
        fundCardView.layoutIfNeeded()
        layoutIfNeeded()
    }
}
extension UICollectionViewCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    public static var nib: UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: Bundle(for: self))
    }
}
