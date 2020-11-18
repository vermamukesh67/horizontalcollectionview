//
//  ViewController.swift
//  horizontalCollectionView
//
//  Created by venvehuob on 18/11/20.
//  Copyright © 2020 vermamukesh. All rights reserved.
//

import UIKit

struct CardModel {
    var label: String?
    var title: String?
    var leftLabel: String?
    var leftTitle: String?
    var rightLabel: String?
    var rightTitle: String?
    var footerLabel: String?
    var footerTitle: String?
    var footerImage: UIImage?
}
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(DataCardUICollectionViewCell.nib, forCellWithReuseIdentifier: "cell")
        }
    }
    var arrFundCardModel = [CardModel]()
    @IBOutlet weak var heightCnnstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareDataModel()
        self.prepareCollectionView()
    }
    fileprivate func prepareCollectionView() {
        collectionView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 8) // Give left spacing = left spacing given in xib (8px) + adding 16px to make it 24px
        let width: CGFloat = self.view.frame.size.width - itemInset.left - 2*itemInset.right
        // height for item
        let height: CGFloat = getMaxHeight(width: width, arrFundModel: arrFundCardModel)
        heightCnnstraint.constant = height
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = itemInset
        layout.minimumLineSpacing = 0.0
        self.collectionView.collectionViewLayout = layout
    }
    fileprivate func prepareDataModel() {
        arrFundCardModel.removeAll()
        for i in 0..<10 {
            var fundModel = CardModel.init(
                label: (i % 2 == 0) ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fermentum nisi sit amet tellus euismod rutrum. " : "Maecenas placerat placerat lectus ut pretium",
                title: "Lorem ipsum dolor",
                leftLabel: "Lorem ipsum dolor",
                leftTitle: "LOREM IPSUM",
                rightLabel: "Lorem ipsum dolor",
                rightTitle: "LOREM IPSUM",
                footerLabel: "Status: ",
                footerTitle: "OK",
                footerImage: nil)
            if i == 2 {
                fundModel.label = "Lorem ipsum dolor sit amet"
                fundModel.title = nil
            }
            arrFundCardModel.append(fundModel)
        }
    }
    fileprivate func getMaxHeight(width: CGFloat, arrFundModel: [CardModel]) -> CGFloat {
        var height: CGFloat = 0.0
        for fundModel in arrFundModel {
            let fundCardView = DataCardView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: 0))
            fundCardView.label = fundModel.label
            fundCardView.title = fundModel.title
            fundCardView.leftLabel = fundModel.leftLabel
            fundCardView.leftTitle = fundModel.leftTitle
            fundCardView.rightLabel = fundModel.rightLabel
            fundCardView.rightTitle = fundModel.rightTitle
            fundCardView.footerLabel = fundModel.footerLabel
            fundCardView.footerTitle = fundModel.footerTitle
            fundCardView.footerImage = fundModel.footerImage
            fundCardView.autosize(maxWidth: fundCardView.frame.size.width) // resize your view
            height = max(height, fundCardView.frame.size.height)
        }
        return height + 32 // extra top bottom space added
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFundCardModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?  DataCardUICollectionViewCell
        cell?.setupUI(fundModel: arrFundCardModel[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
extension UIView {
    func autosize(maxWidth: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        let dummyContainerView = UIView(frame: CGRect(x: 0, y: 0, width: maxWidth, height: 10000000))
        dummyContainerView.addSubview(self)
        dummyContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        dummyContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        dummyContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: 8).isActive = true
        setNeedsLayout()
        layoutIfNeeded()
        removeFromSuperview()
        frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        translatesAutoresizingMaskIntoConstraints = true
    }
}

