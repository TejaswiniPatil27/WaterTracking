//
//  ViewController.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 16/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img_waterDrop: UIImageView!
    
    @IBOutlet weak var lbl_header: UILabel!
    
    @IBOutlet weak var lbl_details: UILabel!
    
    @IBOutlet weak var btn_continue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetUp()
    }

    func uiSetUp(){
        btn_continue.setThemeButtonUI()
    }
    @IBAction func continueAction(_ sender: UIButton) {
        let enterNameVC = self.storyboard?.instantiateViewController(withIdentifier: "EnterNameViewController")as! EnterNameViewController
        self.navigationController?.pushViewController(enterNameVC, animated: false)
    }
}

