//
//  AboutTableViewCell.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 25/08/24.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel!
    
    @IBOutlet weak var about: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        aboutLabel.text = "About"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
