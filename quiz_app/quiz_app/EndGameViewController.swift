//
//  EndGameViewController.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/30/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var mFinishMessage: UITextView!
    @IBOutlet weak var mFinalScore: UITextView!
    
    var mQuiz: Quiz?;
    var delegate: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (mQuiz != nil) {
            let numCorrect = mQuiz?.mNumberCorrect;
            mFinalScore.text = "Final Score: \(numCorrect!)/\(mQuiz!.size())";
            if (numCorrect! > (mQuiz!.size())/2) {
                mFinishMessage.text = "Congrats! You got more than half correct!";
            } else {
                mFinishMessage.text = "Sorry, but you failed.";
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        
    }
    
    @IBAction func quit(_ sender: UIButton) {
        
    }
    

}
