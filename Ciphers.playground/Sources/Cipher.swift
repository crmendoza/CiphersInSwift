import Foundation

public class Cipher {
    
    public static func atbashCipher(_ plainText: String) -> String {
        let cipher = zip(CipherText.alphabet, CipherText.alphabet.reversed()).reduce([String: String]()) { (dict, arg1) -> [String: String] in
            let (key, value) = arg1
            var dict = dict
            dict[String(key)] = String(value)
            return dict
        }
        
        let cipherText = Array(plainText.lowercased().replacingOccurrences(of: " ", with: "")).compactMap { String($0) }.map { (str) -> String in
            return cipher[str] ?? ""
        }
        return cipherText.joined()
    }
    
    public static func atbashCipher2(_ plainText: String) -> String {
        let cipherText =  Array(plainText.lowercased().replacingOccurrences(of: " ", with: "")).compactMap { (char) -> String? in
            if let index = CipherText.alphabet.index(of: char) {
                return String(CipherText.alphabet[CipherText.alphabet.count - 1 - index])
            }
            return nil
        }
        
        return cipherText.joined()
    }
    
    public static func rot13(_ plainText: String) -> String {
        return Cipher.ceasarCipher(key: 13, plainText)
    }
    
    public static func ceasarCipher(key: Int, _ plainText: String) -> String {
        let formatted = plainText.lowercased().replacingOccurrences(of: " ", with: "")
        let cipherText = Array(formatted).compactMap { (char) -> String? in
            if let index = CipherText.alphabet.index(of: char) {
                return String(CipherText.alphabet[(index+key) % CipherText.alphabet.count])
            }
            return nil
            }.joined()
        return cipherText
    }
    
}
