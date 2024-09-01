//
//  ProfileViewController.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 25/08/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    var portfolio : ProfileModel?
    var expTableViewHeight = 0.0
    var aboutCellHeight = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        readJSONFile()
    }
    func registerCells(){
        profileTableView.separatorStyle = .none
        profileTableView.register(UINib(nibName: "BasicInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "BasicInfoTableViewCell")
        profileTableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutTableViewCell")
        profileTableView.register(UINib(nibName: "ExperienceTableViewCell", bundle: nil), forCellReuseIdentifier: "ExperienceTableViewCell")
        profileTableView.register(UINib(nibName: "EducationTableViewCell", bundle: nil), forCellReuseIdentifier: "EducationTableViewCell")
        profileTableView.register(UINib(nibName: "SkillsTableViewCell", bundle: nil), forCellReuseIdentifier: "SkillsTableViewCell")
        if #available(iOS 15.0, *) {
            profileTableView.sectionHeaderTopPadding = 3
        }
        self.calculateExpCellHeight { success in
            self.profileTableView.dataSource = self
            self.profileTableView.delegate = self
            self.profileTableView.reloadData()
        }
        
    }
    func calculateExpCellHeight(completion: @escaping (Bool) -> Void){
        if let portfolio = self.portfolio{
            for val in 0..<portfolio.experience.count{
                let des = portfolio.experience[val].description.html2String
                var cellHeight = Helpers.sharedInstance.heightForText(string: des, width: UIScreen.main.bounds.width - 70, font: UIFont.systemFont(ofSize: 15))
                cellHeight += 100.00
                expTableViewHeight = expTableViewHeight + cellHeight
            }
            var height = Helpers.sharedInstance.heightForText(string: portfolio.about, width: UIScreen.main.bounds.width - 70, font: UIFont.systemFont(ofSize: 15))
            height = height + 55.00
            aboutCellHeight = height
            completion(true)
        }
    }
    func readJSONFile() {
        Helpers.sharedInstance.readJSONFile(forName: "Portfolio") { info in
            guard let jsonData = try? JSONSerialization.data(withJSONObject: info, options: .prettyPrinted) else {
                  return
               }
            let decoder = JSONDecoder()
            if let profile = try? decoder.decode(ProfileModel.self, from: jsonData) {
                self.portfolio = profile
                self.registerCells()
                }
        }
    }
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInfoTableViewCell", for: indexPath) as! BasicInfoTableViewCell
            if let portfolio = self.portfolio{
                cell.namelabel.text = portfolio.name
                cell.designationAndWorkLabel.text = portfolio.current_designation + " " + "at" + " " + portfolio.current_company
                cell.locationLabel.text = portfolio.current_address
                if portfolio.openToWork{
                    cell.openToViewHeight.constant = 80
                    cell.openToOptionsLabel.text = portfolio.job_preferences[0].data.joined(separator: ",")
                    cell.showDetailsLabel.addTapGestureRecognizer {
                        // TODO: Navigate to screen and display Open to work job roles
                        
                        let alert = JobPreferencesViewController()
                        alert.name = portfolio.name
                        alert.job_preferences = portfolio.job_preferences
                                self.present(alert, animated: true)
                    }
                }else{
                    cell.openToViewHeight.constant = 0
                }
                cell.mobileBtn.addTapGestureRecognizer {
                    let numberUrl = URL(string: "tel://\(portfolio.contact_number)")!
                    if UIApplication.shared.canOpenURL(numberUrl) {
                        UIApplication.shared.open(numberUrl)
                    }
                    
                }
                cell.emailBtn.addTapGestureRecognizer {
                    let email = portfolio.contact_email
                    if let url = URL(string: "mailto:\(email)") {
                      if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url)
                      } else {
                        UIApplication.shared.openURL(url)
                      }
                    }
                }
            }
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as! AboutTableViewCell
            if let portfolio = self.portfolio{
                cell.about.text = portfolio.about
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceTableViewCell", for: indexPath) as! ExperienceTableViewCell
            if let portfolio = self.portfolio{
                cell.experience = portfolio.experience
                cell.expTableViewHeight.constant = expTableViewHeight
               
            }
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EducationTableViewCell", for: indexPath) as! EducationTableViewCell
            if let portfolio = self.portfolio{
                cell.collegeName.text = portfolio.highest_education_college
                cell.course.text = portfolio.highest_education_stream
                cell.year.text = portfolio.highest_education_from + " - " + portfolio.highest_education_to
               
            }
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SkillsTableViewCell", for: indexPath) as! SkillsTableViewCell
            if let portfolio = self.portfolio{
                cell.skills = portfolio.skills
                cell.skillCollectionViewHeight.constant = CGFloat((portfolio.skills.count/2) * 60)
            }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2{
            return expTableViewHeight + 65
        }else if indexPath.section == 1{
            return aboutCellHeight
        }else if indexPath.section == 4{
            if let portfolio = self.portfolio{
                return CGFloat((portfolio.skills.count/2) * 60)
            }
            
        }
        return UITableView.automaticDimension
    }
   
    
}
