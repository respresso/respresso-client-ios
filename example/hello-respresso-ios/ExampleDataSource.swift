//
//  ExampleDataSource.swift
//  hello-respresso-ios
//
//  Created by Robert Koltai on 2019. 01. 10..
//  Copyright © 2019. ponte Kft. All rights reserved.
//

import UIKit
import Respresso

class ExampleDataSource: NSObject {
    
    let items = [
        ExampleItem(logoName: "collab_multiplatform", description: RespressoStrings.collaborativeMultiplatform),
        ExampleItem(logoName: "automate", description: RespressoStrings.automatical),
        ExampleItem(logoName: "security", description: RespressoStrings.security),
        ExampleItem(logoName: "collaboration", description: RespressoStrings.collaborative),
    ]
}

// MARK: - UITableViewDataSource

extension ExampleDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExampleCell.reuseIdentifier, for: indexPath)
        
        guard let exampleCell = cell as? ExampleItemView else { return cell }
        
        exampleCell.setup(for: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}
