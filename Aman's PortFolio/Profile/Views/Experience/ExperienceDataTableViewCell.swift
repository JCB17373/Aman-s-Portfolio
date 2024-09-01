//
//  ExperienceDataTableViewCell.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 01/09/24.
//

import UIKit

class ExperienceDataTableViewCell: UITableViewCell {

    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var joiningData: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
