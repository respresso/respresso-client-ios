//
//  ExampleCell.swift
//  hello-respresso-ios
//
//  Created by Robert Koltai on 2019. 01. 10..
//  Copyright © 2019. ponte Kft. All rights reserved.
//

import UIKit

class ExampleCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public properties
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    static let estimateHeight: CGFloat = 177.0

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clear()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        clear()
    }
}

// MARK: - Private

private extension ExampleCell {
    
    func clear() {
        logoImageView.image = nil
        descriptionLabel.text = nil
    }
}

// MARK: - ExampleItemView

extension ExampleCell: ExampleItemView {
    
    func setup(for item: ExampleItem) {
        logoImageView.image = UIImage(named: item.logoName)
        descriptionLabel.text = item.description
    }

}
