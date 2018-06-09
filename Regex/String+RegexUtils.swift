//
//  String+RegexUtils.swift
//  Regex
//
//  Created by Miguel Angel Adan Roman on 8/6/18.
//  Copyright © 2018 Avantiic. All rights reserved.
//

import Foundation

extension String {
    
    func matches(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            
            return results.compactMap {
                if let cRange = Range($0.range, in: self) {
                    return String(self[cRange])
                }
                
                return nil
            }
        } catch {
            return []
        }
    }
}
