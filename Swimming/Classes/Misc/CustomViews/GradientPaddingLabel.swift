//
//  GradientPaddingLabel.swift
//  Swimming
//
//  Created by Андрей Чернышев on 12.06.2023.
//

import UIKit

class GradientPaddingLabel: PaddingLabel {
    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        layer as! CAGradientLayer
    }
}
