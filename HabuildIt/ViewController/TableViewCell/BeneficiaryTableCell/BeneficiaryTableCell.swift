//
//  BeneficiaryTableCell.swift
//  HabuildIt
//
//  Created by Vivek Singh on 19/11/23.
//

import UIKit

class BeneficiaryTableCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var labelContact: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var labelUpdated: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCard.makeRoundCorner(5)
        btnShare.makeRoundCorner(5)
        btnShare.titleLabel?.font = UIFont.kAppDefaultFontBold(ofSize: 10)
        labelContact.isHidden = false

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
