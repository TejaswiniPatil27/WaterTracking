//
//  Extension.swift
//  WaterTracking
//
//  Created by Tejaswini Patil on 17/04/24.
//

import Foundation
import UIKit

//MARK: - UIButton
extension UIButton {
    func setThemeButtonUI() {
        self.backgroundColor = AppColor.AppThemeColor
        self.layer.cornerRadius = 20
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.gray.cgColor
    }
}

//MARK: - UIViewController
extension UIViewController {
    func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/5, y: self.view.frame.size.height - 150, width: 250, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "Avenir Medium", size: 17)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseIn, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

//MARK: - UITextfield
extension UITextField {
    func isEmpty() -> Bool{
        guard let text = self.text else {
            // Text field text is nil
            return true
        }
        // Check if text field text is empty or contains only whitespace characters
        return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
