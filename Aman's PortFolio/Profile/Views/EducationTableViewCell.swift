//
//  EducationTableViewCell.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 01/09/24.
//

import UIKit

class EducationTableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var collegeName: UILabel!
    @IBOutlet weak var course: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerLabel.text = "Education"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
