//
//  SkillsTableViewCell.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 01/09/24.
//

import UIKit

class SkillsTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var skillCollectionView: UICollectionView!
    @IBOutlet weak var skillCollectionViewHeight: NSLayoutConstraint!
    
    var skills: [Skills]! {
        didSet{
            skillCollectionView.dataSource = self
            skillCollectionView.delegate = self
//            skillCollectionViewHeight.constant = 450
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        headerLabel.text = "Skills"
        skillCollectionView.register(UINib(nibName: "SkillsDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SkillsDataCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillsDataCollectionViewCell", for: indexPath) as! SkillsDataCollectionViewCell
        cell.skillName.text = skills[indexPath.row].skill_name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    
}
