//
//  Image+Extension.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-22.
//

import Foundation
import SwiftUI

extension View {
    
    func asImage() -> UIImage {
        let controller = UIHostingController(rootView: self)

        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)

        let size = controller.view.intrinsicContentSize
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.backgroundColor = UIColor.systemBackground
        controller.view.sizeToFit()

        let image = UIImage(view: controller.view)
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIImage {
    
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions((view.frame.size), false, 0.0)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
