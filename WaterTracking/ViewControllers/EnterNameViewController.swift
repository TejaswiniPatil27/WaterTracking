//
//  EnterNameViewController.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import UIKit

class EnterNameViewController: UIViewController {

    
    @IBOutlet weak var txt_name: UITextField!
    
    @IBOutlet weak var btn_continue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        uiSetUp()
        
    }
    
    func uiSetUp() {
        btn_continue.setThemeButtonUI()
        txt_name.delegate = self
    }

    @IBAction func continueAction(_ sender: UIButton) {
        if !txt_name.isEmpty() {
            CommonClass.MyUser?.name = txt_name.text
            let genderVC = self.storyboard?.instantiateViewController(withIdentifier: "GenderViewController")as! GenderViewController
            self.navigationController?.pushViewController(genderVC, animated: false)
        }else {
            self.showToast(message: "Please enter your name")
        }
    }
    
}
extension EnterNameViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
