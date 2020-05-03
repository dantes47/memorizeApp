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
    
    var blankCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "You should provide a memory item before trying to show this view controller..")
        showText()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    func showText() {
    
        let words = item.text.components(separatedBy: " ")
        var output = ""
        
        for (index, word) in words.enumerated() {
            if index < blankCounter {
                output += "\(word) "
            } else {
                let blank = String(repeating: "_", count: word.count)
                output += "\(blank) "
            }
        }
        
        textView.text = output
    }
    
    @objc func wordsTapped() {
        blankCounter += 1
        showText()
    }

}
