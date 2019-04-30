//
//  Concentration.swift
//  Cpmcemtration
//
//  Created by cc on 2019/4/28.
//  Copyright © 2019 cc. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?{
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp == true {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    func chooseCard(at index: Int)  {
        if !cards[index].IsMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 匹配成功
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].IsMatched = true
                    cards[index].IsMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //没有卡片朝上或者两张不匹配的卡片朝上
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
            
        }
    }
}
