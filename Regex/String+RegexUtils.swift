//
//  String+RegexUtils.swift
//  Regex
//
//  Created by Miguel Angel Adan Roman on 8/6/18.
//  Copyright © 2018 Avantiic. All rights reserved.
//

import Foundation

extension String {
    
    private func createRanges(for results: [NSTextCheckingResult]) -> [NSRange] {
        var partsRanges = [NSRange]()
        for result in results {
            let lowerBound: Int
            let upperBound: Int
            let previousIndex = partsRanges.count - 1
            if previousIndex >= 0 {
                let previousRange = partsRanges[previousIndex]
                lowerBound = previousRange.upperBound
                upperBound = result.range.lowerBound
                partsRanges.append(NSMakeRange(lowerBound, upperBound - lowerBound))
            } else {
                // Is the first element
                lowerBound = 0
                upperBound = result.range.lowerBound
                let length = upperBound - lowerBound
                if lowerBound != length && lowerBound != 0 {
                    partsRanges.append(NSMakeRange(lowerBound, length))
                }
            }
            
            partsRanges.append(result.range)
        }
        
        if let lastRange = partsRanges.last, lastRange.upperBound < self.count {
            partsRanges.append(NSMakeRange(lastRange.upperBound, self.count - lastRange.upperBound))
        }
        
        return partsRanges
    }
    
    public func split(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            let partsRanges = createRanges(for: results)
            return partsRanges.compactMap({ (range) -> String? in
                if let cRange = Range(range, in: self) {
                    return String(self[cRange])
                }
                
                return nil
            })
            
        } catch {
            return []
        }
    }
    
    public func matches(regex: String) -> [String] {
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
