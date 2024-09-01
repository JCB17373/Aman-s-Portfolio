//
//  ExperienceTableViewCell.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 26/08/24.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var expTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var expTableView: UITableView!
    var heightForDescription = 0.0
    var experienceHeightClosure : ((_ height: CGFloat) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        experienceLabel.text = "Experience"
        
        expTableView.register(UINib(nibName: "ExperienceDataTableViewCell", bundle: nil), forCellReuseIdentifier: "ExperienceDataTableViewCell")
        expTableView.separatorStyle = .none
    }
    var experience : [Experience]!  {
        didSet{
            expTableView.dataSource = self
            expTableView.delegate = self
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.experience.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceDataTableViewCell", for: indexPath) as? ExperienceDataTableViewCell, let exp = experience{
            cell.descriptionLabel.text = exp[indexPath.row].description.html2String
            
            cell.designationLabel.text = exp[indexPath.row].designation
            cell.companyName.text = exp[indexPath.row].company_name
            let duration = " (" + exp[indexPath.row].total_years + " " + exp[indexPath.row].total_months + ")"
            cell.joiningData.text = exp[indexPath.row].joined_on + " - " + exp[indexPath.row].releave_on + duration
            cell.selectionStyle = .none
            cell.clipsToBounds = true
            return cell
            
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let exp = experience{
            var height = Helpers.sharedInstance.heightForText(string: exp[indexPath.row].description.html2String, width: UIScreen.main.bounds.width - 70, font: UIFont.systemFont(ofSize: 15))
            height = height + 100.00
            return height
        }
        return UITableView.automaticDimension
    }
    
}
