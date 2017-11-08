//
//  RomanToInt.swift
//  
//
//  Created by imIzaac on 11/7/17.
//


//From https://leetcode.com/problems/roman-to-integer/description/
//
//Given a roman numeral, convert it to an integer.
//
//Input is guaranteed to be within the range from 1 to 3999.

/*
 Solution details: We can make the following assumptions from the code,
 we're never going to see a character bigger than 3999, which means we only need the given characters in the charToNum function. However this solution can calculate any number that doesn't overflow as long as it follows convention
 
 Convention is that when you are writing with roman numerals a 8 is ALWAYS VIII and never IIX.
 
 Because of this we only need to look ahead one number when we are creating our solution. Then we perform a comparison. If our current number is >= the previous number, we add. Otherwise we subtract.
 
 You will also ALWAYS add the last number because of this convention. With these assumptions in mind, we just convert character to numbers, perform one comparison on each, and add or subract to arrive at our solution.
 
 At time of creation this answer was faster than 94.6% of solutions.
 */


class Solution {
    func romanToInt(_ s: String) -> Int {
        var total = 0
        var previous = 0
        var current = 0
        
        s.map { (char) in
            previous = current
            current = charToNum(char)
            if previous >= current {
                total += previous
            } else {
                total -= previous
            }
        }
        
        total += current
        return total
    }
    
    func charToNum(_ char: Character) -> Int {
        let letter = String.init(char)
        switch letter {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C": return 100
        case "D": return 500
        case "M": return 1000
        default: return 0
        }
    }
}

