import Foundation

public class Cipher {
    
    public static func atbashCipher(_ plainText: String) -> String {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let cipher = zip(alphabet, alphabet.reversed()).reduce([String: String]()) { (dict, arg1) -> [String: String] in
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
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        let cipherText =  Array(plainText.lowercased().replacingOccurrences(of: " ", with: "")).compactMap { (char) -> String? in
            if let index = alphabet.index(of: char) {
                return String(alphabet[alphabet.count - 1 - index])
            }
            return nil
        }
        
        return cipherText.joined()
    }
    
}
