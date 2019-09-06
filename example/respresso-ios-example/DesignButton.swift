//
//  DesignButton.swift
//  respresso-ios-example
//
//  Created by Robert Koltai on 2019. 09. 02..
//  Copyright © 2019. ponte Kft. All rights reserved.
//

import UIKit

class DesignButton: UIButton {
    
    private let topLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topLayer.frame = CGRect(x: isHighlighted ? 0 : 3, y: isHighlighted ? 0 : 3, width: layer.bounds.width, height: layer.bounds.height)
    }

}

// MARK: - Private


private extension DesignButton {
    
    func setupButton() {
        contentEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        layoutIfNeeded()
        layer.cornerRadius = bounds.height / 2
        
        topLayer.cornerRadius = layer.cornerRadius
        topLayer.borderColor = UIColor.darkGray.cgColor
        topLayer.borderWidth = 1
        
        if let sublayers = layer.sublayers, !sublayers.contains(topLayer) {
            layer.addSublayer(topLayer)
        }
        
    }

    
}
