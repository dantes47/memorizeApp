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
    
    
    let visibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.brown
    ]
    
    let invisibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.brown
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "You should provide a memory item before trying to show this view controller..")
        textView.attributedText = showText(for: item)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    func showText(for memoryItem: MemoryItem) -> NSAttributedString {
        let words = memoryItem.text.components(separatedBy: " ")
        let output = NSMutableAttributedString()
        
        let space = NSAttributedString(string: " ", attributes: visibleText)
        
        for (index, word) in words.enumerated() {
            if index < blankCounter {
                let attributedWord = NSAttributedString(string: word,
                        attributes: visibleText)
                output.append(attributedWord)
            } else {
                var strippedWord = word,
                     punctuation: String?
                
                if ".,".contains(word.last!) {
                    punctuation = String(strippedWord.removeLast())
                }
                
                let attributedWord = NSAttributedString(string: word,
                        attributes: invisibleText)
                output.append(attributedWord)
                
                if let symbol = punctuation {
                    let attributedPunctuation = NSAttributedString(string:
                        symbol, attributes: visibleText)
                    output.append(attributedPunctuation)
                }
            }
            
            output.append(space)
        }
        
        return output
    }
    
    @objc func wordsTapped() {
        blankCounter += 1
        textView.attributedText = showText(for: item)
    }

}
