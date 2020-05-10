//
//  MemoryDataSource.swift
//  Memorize
//
//  Created by Danny on 10/05/2020.
//  Copyright © 2020 Elmob. All rights reserved.
//

import UIKit

class MemoryDataSource: NSObject, UITableViewDataSource {
    var items = [MemoryItem]()
    
    override init() {
        guard let url = Bundle.main.url(forResource: "Items", withExtension: "json") else {
            fatalError("Can't find JSON.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON.")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("Failed to decode JSON")
        }
        items = savedItems
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        
        return cell
    }
    
    func item(at index: Int) -> MemoryItem {
        return items[index]
    }
}
