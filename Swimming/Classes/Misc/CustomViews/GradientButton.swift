//
//  GradientButton.swift
//  Swimming
//
//  Created by Андрей Чернышев on 09.06.2023.
//

import UIKit

class GradientButton: UIButton {
    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
}
