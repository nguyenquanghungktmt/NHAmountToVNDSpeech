//
//  NumberToVietnamese.swift
//  NHAmountToVNDSpeech
//
//  Created by Hung Nguyen Quang on 30/12/24.
//

import Foundation

internal extension String {
    
    func decimalCommaNumber() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        if let input = Double(self) {
            return formatter.string(from: NSNumber(value: input))
        } else {
            return nil
        }
    }
    
    func removeExtraSpaces() -> String {
         return self.replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
     }
}

internal class NumberToVietnamese {
    private var digits = ["không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"]
    private var multipleThousands = ["", "nghìn", "triệu", "tỷ", "nghìn tỷ", "triệu tỷ", "tỷ tỷ", "triệu tỷ tỷ"];
    
    private func tripleToWord(_ triple: String, showZeroHundred: Bool) -> String {
        var nums = Array(triple).map({ return Int($0.asciiValue!) - 48 })
        while nums.count < 3 {
            nums.insert(0, at: 0)
        }
        
        let (a, b, c) = (nums[0], nums[1], nums[2])
        
        if a == 0 && b == 0 && c == 0 {
            return ""
        }
        
        if a == 0 {
            if showZeroHundred {
                return String(format: "không trăm %@", pairToWord(b, c))
            } else {
                return b == 0 ? digits[c] : pairToWord(b, c)
            }
        }
        return String(format: "%@ trăm %@", digits[a], pairToWord(b, c))
    }
    
    private func pairToWord(_ b: Int, _ c: Int) -> String {
        switch b {
        case 0:
            return c == 0 ? "" : String(format: "linh %@", digits[c])
            
        case 1:
            let donvi: String
            switch c {
            case 0:
                donvi = ""
            case 5:
                donvi = "lăm"
            default:
                donvi = digits[c]
            }
            return String(format: "mười %@", donvi)
            
        default:
            let donvi: String
            switch c {
            case 0:
                donvi = ""
            case 1:
                donvi = "mốt"
            case 4:
                donvi = "tư"
            case 5:
                donvi = "lăm"
            default:
                donvi = digits[c]
            }
            return String(format: "%@ mươi %@", digits[b], donvi)
        }
    }
    
    internal func numberToWord(_ num: String) -> String {
        let decimalNum: String = num.decimalCommaNumber() ?? ""
        let listTriple = decimalNum.components(separatedBy: ",")
        if listTriple.count > multipleThousands.count {
            return "Số quá lớn. Không thể đọc"
        }
        
        var vietnameseWords = ""
        for (index, triple) in listTriple.enumerated() {
            let subWord = triple == "000" ? "" : multipleThousands[listTriple.count - index - 1]
            vietnameseWords += String(format: "%@ %@ ", tripleToWord(triple, showZeroHundred: index > 0), subWord)
        }
        return vietnameseWords.removeExtraSpaces().trimmingCharacters(in: .whitespaces) + " đồng"
    }
}
