//
//  JobPreferencesViewController.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 31/08/24.
//

import UIKit

class JobPreferencesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var openToWorkLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    static let controllerIdentifier = String(describing: JobPreferencesViewController.self)
    var name : String!
    var job_preferences : [JobPreference]!
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = "Job Preferences"
        openToWorkLabel.text = "is open to work"
        nameLabel.text = name
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    init() {
            super.init(nibName: JobPreferencesViewController.controllerIdentifier, bundle: Bundle(for: JobPreferencesViewController.self))
            self.modalPresentationStyle = .overCurrentContext
            self.modalTransitionStyle = .crossDissolve
       
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    @IBAction func cancelClicked(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        job_preferences.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = self.job_preferences[indexPath.section].data.joined(separator: ", ")
        cell.textLabel?.numberOfLines = 0
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.job_preferences[section].name
    }
    
}
