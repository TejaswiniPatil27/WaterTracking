//
//  DailyGoalViewController.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import UIKit

class DailyGoalViewController: UIViewController {

    @IBOutlet weak var lbl_waterIntake: UILabel!
    
    @IBOutlet weak var btn_continue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetUp()
        
    }
    func uiSetUp() {
        print("dbhelperInstance.getTotalWaterTaken() ---> \(dbhelperInstance.getTotalWaterTaken())")
        lbl_waterIntake.text = "\(dbhelperInstance.getTotalWaterTaken()) ml"
        btn_continue.setThemeButtonUI()
        
    }
    

    @IBAction func continueAction(_ sender: UIButton) {
    }
    

}
