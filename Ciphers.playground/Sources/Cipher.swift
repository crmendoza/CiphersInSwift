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
    
    public static func fractionedMorse(_ key: String, _ plainText: String) -> String {
        let morseText = plainText.components(separatedBy: " ").map { (word) -> String in
            return Cipher.encodeToMorseCode(word)
            }.joined(separator: "x")
        
        let encryptionTable = Cipher.generateTable(key)
        let encryptedString = Array(morseText).chunked(into: 3).map { (substring) -> String in
            return encryptionTable[String(substring)] ?? ""
            }.joined()
        return encryptedString
    }
    
    private static func encodeToMorseCode(_ text: String) -> String {
        return Array(text.uppercased()).map { (char) -> String in
            if let str = CipherText.morseCode[String(char)] {
                return str + "x"
            }
            return ""
            }.joined()
    }
    
    private static func generateTable(_ key: String) -> [String: String] {
        let keySet: [Character] = NSOrderedSet(array: Array(key.lowercased()) + CipherText.alphabet).array as! [Character]
        let components: [Character] = [".", "-", "x"]
        let codeStrings = [
            Cipher.keyComponents(components: components, repeatCount: 9, length: 26),
            Cipher.keyComponents(components: components, repeatCount: 3, length: 26),
            Cipher.keyComponents(components: components, repeatCount: 1, length: 26)
            ].map { Array($0) }
        
        let charCodeStrings = (0..<26)
            .map { [codeStrings[0][$0], codeStrings[1][$0], codeStrings[2][$0]].map { String($0) } }
            .map { $0.joined() }
        
        var table: [String: String] = [:]
        charCodeStrings.enumerated().forEach { (offset, code) in
            
            table[code] = String(keySet[offset])
        }
        return table
    }
    
    private static func keyComponents(components: [Character], repeatCount: Int, length: Int) -> String {
        let oneSpan = components.map { String(repeating: $0, count: repeatCount) }.joined()
        return String(String(repeating: oneSpan, count: (length / components.count / repeatCount) + 1).prefix(length))
    }
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
