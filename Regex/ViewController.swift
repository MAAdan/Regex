//
//  ViewController.swift
//  Regex
//
//  Created by Miguel Angel Adan Roman on 8/6/18.
//  Copyright © 2018 Avantiic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let fileName = "Strings"
        let fileExtension = "txt"
        if let path = Bundle.main.path(forResource: fileName, ofType: fileExtension) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                if let fileContents = String(data: data, encoding: .utf8) {
                    
                    let matches = fileContents.matches(regex: "\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\b")
                    
                    print (matches)
                }
            } catch let catchedError {
                print("read error: \(catchedError.localizedDescription)")
            }
        } else {
            print("no such file: \(fileName).\(fileExtension)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

