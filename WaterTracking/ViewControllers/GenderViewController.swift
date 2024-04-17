//
//  GenderViewController.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import UIKit

class genderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view_outer: UIView!
    
    @IBOutlet weak var lbl_title: UILabel!
      
    @IBOutlet weak var img_tick: UIImageView!

    
}

class GenderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btn_continue: UIButton!
    
    var selectedGender: String?
    var genderArray:[[String:String]] = [["Name":"Female","isSelected": "False"],
                                        ["Name":"Male","isSelected": "False"],
//                                        ["Name":"Female: Pregnant","isSelected": "False"],
//                                        ["Name":"Female: Breastfeeding","isSelected": "False"],
//                                        ["Name":"Other","isSelected": "False"]
    ];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        uiSetUp()
    }
    
    func uiSetUp() {
        btn_continue.setThemeButtonUI()
    }
    

    @IBAction func continueAction(_ sender: UIButton) {
        let myUser = MyUser(gender: selectedGender)
        CommonClass.MyUser = myUser
        if selectedGender != nil {
            let weightVC = self.storyboard?.instantiateViewController(withIdentifier: "WeightViewController")as! WeightViewController
            self.navigationController?.pushViewController(weightVC, animated: false)
        }else {
            self.showToast(message: "Please choose your gender")
        }
    }
    
}

extension GenderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genderTableViewCell", for: indexPath)as! genderTableViewCell
        cell.view_outer.layer.borderWidth = 0.5
        cell.view_outer.layer.cornerRadius = 5
        cell.view_outer.layer.borderColor = UIColor.lightGray.cgColor
        cell.lbl_title.text = genderArray[indexPath.row]["Name"]
        if genderArray[indexPath.row]["isSelected"] == "True" {
            cell.img_tick.highlightedImage = UIImage(systemName: "checkmark.seal.fill")
        }else {
            cell.img_tick.image = UIImage(systemName: "checkmark.seal")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if genderArray[indexPath.row]["isSelected"] == "False" {
            genderArray[indexPath.row]["isSelected"] = "True"
            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.clear
            selectedGender = genderArray[indexPath.row]["Name"] ?? ""
        }
        
    }
}
