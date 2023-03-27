//
//  FloatingViewTVCell.swift
//  LetsTrackTest
//
//  Created by Apple on 26/03/23.
//

import UIKit

class FloatingViewTVCell: UITableViewCell {

    
    @IBOutlet weak var lblMemberName: UILabel!
    @IBOutlet weak var lblMemberLocationStatus: UILabel!
    @IBOutlet weak var lblMemberJoinedFrom: UILabel!
    @IBOutlet weak var ImgvMainMember: UIImageView!
    @IBOutlet weak var lblBtryStatus: UILabel!
    @IBOutlet weak var viewBtryBack: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
