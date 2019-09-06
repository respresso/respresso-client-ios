//
//  ViewController.swift
//  respresso-ios-example
//
//  Created by Robert Koltai on 2019. 08. 29..
//  Copyright © 2019. ponte Kft. All rights reserved.
//

import UIKit
import Respresso

fileprivate let respressoWebPageURLString = "https://respresso.io/"

class ViewController: UIViewController {
    
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var checkItNowButton: DesignButton!
    
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        updateTexts()
        addLiveLocalizationObserver()
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

// MARK: - Private

private extension ViewController {
    
    func setupView() {
        gradientView.colors = [RespressoColors.gradientblue, RespressoColors.gradientlightblue, RespressoColors.gradientlightgreen]
        gradientView.locations = [0.1, 0.3, 1.0]
        gradientView.layer.mask = layerMask(rect: gradientView.frame, cutHeight: gradientView.bounds.height * 0.25)
        
        abstractLabel.font = OpenSans.bold(withSize: 24)
        
        checkItNowButton.backgroundColor = RespressoColors.midgreen
        checkItNowButton.titleLabel?.font =  OpenSans.extraBold(withSize: 14)
        checkItNowButton.addTarget(self, action: #selector(openRespressoWebpage), for: UIControl.Event.touchUpInside)
    }
    
    func layerMask(rect: CGRect, cutHeight: CGFloat) -> CAShapeLayer {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cutHeight))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.close()
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        return maskLayer
    }
    
    func updateTexts() {
        abstractLabel.text = RespressoStrings.demoAbstract
        checkItNowButton.setTitle(RespressoStrings.demoCheckItNow.uppercased(), for: UIControl.State.normal)
    }
    
    func addLiveLocalizationObserver() {

        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name.RespressoDidUpdateLocalization, object: nil, queue: nil) { [weak self] (notification) in
            self?.updateTexts()
        }
    }
    
    @objc func openRespressoWebpage() {
        guard let url = URL(string: respressoWebPageURLString) else { return }
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}

