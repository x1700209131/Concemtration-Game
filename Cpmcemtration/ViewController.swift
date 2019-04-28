//
//  ViewController.swift
//  Cpmcemtration
//
//  Created by cc on 2019/4/26.
//  Copyright © 2019 cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   lazy var game:Concentration = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["🎃","👻","🎃","👻"]
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let carNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[carNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
       
    }
    
  
   
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    func flipCard(withEmoji emoji:String, on button:UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor  = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

