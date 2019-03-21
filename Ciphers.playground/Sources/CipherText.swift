import Foundation

public struct CipherText {
    static let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    static let morseCode: Dictionary = [ "A": ".-", "B": "-...", "C": "-.-.", "D": "-..",
                             "E": ".", "F": "..-.", "G": "--.", "H": "....",
                             "I": "..", "J": ".---", "K": "-.-", "L": ".-..",
                             "M": "--", "N": "-.", "O": "---", "P": ".--.",
                             "Q": "--.-", "R": ".-.", "S": "...", "T": "-",
                             "U": "..-", "V": "...-", "W": ".--", "X": "-..-",
                             "Y": "-.--", "Z": "--.." ]
    
}
