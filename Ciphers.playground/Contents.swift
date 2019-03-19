import UIKit

func rot13(_ plainText: String) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    let formatted = plainText.lowercased().replacingOccurrences(of: " ", with: "")
    let cipherText = Array(formatted).compactMap { (char) -> String? in
        if let index = alphabet.index(of: char) {
            return String(alphabet[(index+13) % alphabet.count])
        }
        return nil
    }.joined()
    return cipherText
}

//Cipher.atbashCipher("Attack at dawn")
//Cipher.atbashCipher2("Attack at dawn")
rot13("Attack at dawn")
