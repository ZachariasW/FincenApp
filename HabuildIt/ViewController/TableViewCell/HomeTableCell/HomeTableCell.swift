//
//  HomeTableCell.swift
//  CircleOnlineMarketing
//
//  Created by Mobilecoderz5 on 26/09/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var labelbadge: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCard.makeRoundCorner(5)
        labelbadge.makeRounded()
        labelbadge.isHidden = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
