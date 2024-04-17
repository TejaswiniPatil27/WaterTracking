//
//  WeightViewController.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import UIKit

class WeightViewController: UIViewController {

    @IBOutlet weak var txt_weight: UITextField!
    
    @IBOutlet weak var btn_calculate: UIButton!
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetUp()
        // Set up activity indicator
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    func uiSetUp() {
        btn_calculate.setThemeButtonUI()
        txt_weight.delegate = self
    }
    
    func calculateWaterIntake(gender: String, weight: Double) -> String? {
        switch gender.lowercased() {
        case "male":
            return formatDoubleValue(doubleValue: 0.035 * weight)
        case "female":
            return formatDoubleValue(doubleValue: 0.031 * weight)
        default:
            return nil // Invalid gender
        }
    }


    @IBAction func calculateAction(_ sender: UIButton) {
        if !txt_weight.isEmpty() {
            CommonClass.MyUser?.weight = txt_weight.text
            if let hydration = calculateWaterIntake(gender: CommonClass.MyUser?.gender ?? "", weight: Double(txt_weight.text ?? "") ?? 0.0) {
                CommonClass.MyUser?.totalWaterIntake = hydration
            } else {
                print("Invalid gender")
            }
            
            // Show activity indicator
            activityIndicator.startAnimating()
            dbhelperInstance.addUserObject(myUser: CommonClass.MyUser ?? MyUser())
            // Start a timer to stop the activity indicator after 5 seconds
            Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { _ in
                // Stop activity indicator after 3 seconds
                self.activityIndicator.stopAnimating()
                let dailyGoal = self.storyboard?.instantiateViewController(withIdentifier: "DailyGoalViewController")as! DailyGoalViewController
                self.navigationController?.pushViewController(dailyGoal, animated: false)
            }
        }
        else {
            self.showToast(message: "Please enter your weight")
        }
    }
    
    func formatDoubleValue(doubleValue: Double) -> String {
        return String(format: "%.3f", doubleValue)
    }
}

extension WeightViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
