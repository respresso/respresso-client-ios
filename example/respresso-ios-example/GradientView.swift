//
//  GradientView.swift
//  respresso-ios-example
//
//  Created by Robert Koltai on 2019. 08. 29..
//  Copyright © 2019. ponte Kft. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    private weak var gradientLayer: CAGradientLayer?
    
    var colors: [UIColor]? {
        set {
            gradientLayer?.colors = newValue?.map { $0.cgColor }
        }
        get {
            return gradientLayer?.colors?.map { UIColor(cgColor: $0 as! CGColor) }
        }
    }
    
    var locations: [NSNumber]? {
        set {
            gradientLayer?.locations = newValue
        }
        get {
            return gradientLayer?.locations
        }
    }
    
    open var startPoint: CGPoint {
        set {
            gradientLayer?.startPoint = startPoint
        }
        get {
            return gradientLayer?.startPoint ?? CGPoint.zero
        }
    }
    
    open var endPoint: CGPoint {
        set {
            gradientLayer?.endPoint = endPoint
        }
        get {
            return gradientLayer?.endPoint ?? CGPoint(x: 0, y: 1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGradientLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupGradientLayer()
    }
}

// MARK: - Private

private extension GradientView {
    
    func setupGradientLayer() {
        let newGradientLayer = CAGradientLayer()
        newGradientLayer.frame = self.bounds
        newGradientLayer.startPoint = CGPoint(x: 0, y: 0.8)
        newGradientLayer.endPoint = CGPoint(x: 1, y: 0.2)
        
        layer.insertSublayer(newGradientLayer, at: 0)
        gradientLayer = newGradientLayer
    }

}
