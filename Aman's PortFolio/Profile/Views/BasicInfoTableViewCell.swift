//
//  BasicInfoTableViewCell.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 25/08/24.
//

import UIKit

class BasicInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var designationAndWorkLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mobileBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var openToView: UIView!
    @IBOutlet weak var openToLabel: UILabel!
    @IBOutlet weak var openToOptionsLabel: UILabel!
    @IBOutlet weak var showDetailsLabel: UILabel!
    @IBOutlet weak var openToViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        mobileBtn.setTitle("Call", for: .normal)
        emailBtn.setTitle("Email", for: .normal)
        mobileBtn.setImage(UIImage(named: "call"), for: .normal)
        emailBtn.setImage(UIImage(named: "email"), for: .normal)
        openToLabel.text = "Open To Work"
        showDetailsLabel.text = "Show Details"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
