//
//  QuizViewController.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/5/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: Properties
    var mQuiz: Quiz!;
    var mQuestion: Question!;
    let cellReuseIdentifier = "AnswerCell";
    
    // MARK: Outlets
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mQuestionQuery: UITextView!
    @IBOutlet weak var mScore: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mQuiz = Quiz();
        //mQuiz.getNextQuestion();
        // Do any additional setup after loading the view.
        //self.MTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier);
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        self.mTableView.delegate = self;
        self.mTableView.dataSource = self;
        self.mTableView.tableFooterView = UIView();
        mQuestionQuery.text = mQuiz.getCurrentQuestion().mQuery;
        mScore.text = "0/0";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: TableView Data Source Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "AnswerChoice";
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AnswerTableCell  else {
            fatalError("The dequeued cell is not an instance of AnswerChoiceTableViewCell.");
        };
        cell.mAnswerText.text = mQuiz.getChoice(index: indexPath.row);
        // Configure the cell...
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return mQuiz.getCurrentQuestion().getNumAnswers();
    }
    
    // MARK: TableView Delegate Methods
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        mTableView.deselectRow(at: indexPath, animated: true);
        _ = mQuiz.isCorrect(row: indexPath.row);
        if (mQuiz.hasMoreQuestions) {
            updateQuestion();
            updateScore();
        } else {
            self.performSegue(withIdentifier: "gameIsDone", sender: self);
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "gameIsDone") {
            guard let destinationVC = segue.destination as? EndGameViewController else {
                fatalError("Where do you think you're going???");
            }
            destinationVC.mQuiz = self.mQuiz;
            destinationVC.delegate = "";
        }
    }
 
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        
        mQuiz.reset();
        _ = self.navigationController?.popViewController(animated: true);

    }
    
    func back(sender: UIBarButtonItem) {
        _ = self.navigationController?.popViewController(animated: true);

    }
    
    // MARK: Private Methods
    
    private func updateScore() {
        mScore.text = "\(mQuiz.mNumberCorrect)/\(mQuiz.mCurrentIndex)";
    }
    
    private func updateQuestion() {
        mQuiz.getNextQuestion();
        mQuestionQuery.text = mQuiz.getCurrentQuestion().mQuery;
        mTableView.reloadData();
    }

}
