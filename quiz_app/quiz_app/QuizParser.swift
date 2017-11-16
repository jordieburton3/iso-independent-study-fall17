//
//  QuizParser.swift
//  quiz_app
//
//  Created by Jordan Burton on 11/16/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import Foundation;
import SwiftyJSON;

class QuizParser {
    
    init() {
        
    }
    
    static func parseJson(_ file: String) {
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: file)) else {
            fatalError("path not valid");
        };
        let json = JSON(data: jsonData);
        print(json);
    }
    
}
