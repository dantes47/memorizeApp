//
//  MemoryViewController.swift
//  Memorize
//
//  Created by Danny on 03/05/2020.
//  Copyright © 2020 Elmob. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var item: MemoryItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "You should provide a memory item before trying to show this view controller..)")
        showText()
    }
    
    func showText()
    {
        textView.text = item.text
    }
    

}
