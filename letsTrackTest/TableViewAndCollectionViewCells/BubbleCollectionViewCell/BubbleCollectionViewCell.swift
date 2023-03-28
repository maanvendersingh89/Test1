//
//  BubbleCollectionViewCell.swift
//  LetsTrackTest
//
//  Created by Apple on 28/03/23.
//

import UIKit

class BubbleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblMemberCount: UILabel!
    @IBOutlet weak var xConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomLblConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var expiredBackView: UIView!
    @IBOutlet weak var lblCircleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
