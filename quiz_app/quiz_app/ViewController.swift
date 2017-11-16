//
//  ViewController.swift
//  quiz_app
//
//  Created by Jordan Burton on 9/26/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var quizzes: [String:String] = [:];
    var quizNames: [String] = [];
    var quizToStart: Quiz?;
    
    // MARK: Outlets
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateQuizMap();
        quizNames = Array(quizzes.keys);
        self.mTableView.delegate = self;
        self.mTableView.dataSource = self;
        self.mTableView.tableFooterView = UIView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "QuizChoice";
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuizChoiceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of QuizChoiceTableViewCell.");
        };
        print("start");
        print(quizNames[indexPath.row]);
        print("end");
        cell.mQuizChoiceText.text = quizNames[indexPath.row];
        // Configure the cell...
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return quizNames.count;
    }
    
    // MARK: TableView Delegate Methods
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        mTableView.deselectRow(at: indexPath, animated: true);
        quizToStart = QuizParser.parseJson(quizzes[quizNames[indexPath.row]]!);
        self.performSegue(withIdentifier: "StartQuiz", sender: nil);
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "StartQuiz") {
            guard let destinationVC = segue.destination as? QuizViewController else {
                fatalError("Where do you think you're going???");
            }
            destinationVC.mQuiz = quizToStart;
        }
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
                quizzes[filename] = "\(path)/\(element)";
                
            }
        }
    }

}

