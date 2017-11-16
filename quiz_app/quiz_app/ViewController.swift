//
//  ViewController.swift
//  quiz_app
//
//  Created by Jordan Burton on 9/26/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var quizzes: [String:String] = [:];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateQuizMap();
        print(quizzes);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private Methods
    
    private func getFilePath(path: String = #file) -> String {
        let url = URL(fileURLWithPath: path);
        let newUrl = url.deletingLastPathComponent();
        return newUrl.path;
    }
    
    private func populateQuizMap() {
        let fileManager = FileManager.default
        let path = getFilePath();
        let enumerator:FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: path)!;
        
        while let element = enumerator.nextObject() as? String {
            if element.hasSuffix("quiz.json") {
                let filename = URL(fileURLWithPath: element).lastPathComponent.replacingOccurrences(of: "_quiz.json", with: "");
                quizzes[filename] = element;
                
            }
        }
    }

}

