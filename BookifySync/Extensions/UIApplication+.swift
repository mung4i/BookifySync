//
//  UIApplication+.swift
//  BookifySync
//
//  Created by Martin Mungai on 17/11/2023.
//

import UIKit

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .first?.keyWindow

    }
    
    var rootViewController: UIViewController {
        UIApplication.shared.firstKeyWindow?.rootViewController ?? UIViewController()
    }
}
