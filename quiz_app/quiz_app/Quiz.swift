//
//  Quiz.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/6/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import Foundation

class Quiz {
    var mQuestions: [Question];
    var mCurrentIndex: Int;
    var mNumberCorrect: Int;
    var hasMoreQuestions: Bool;
    var mQuestion: Question;
    
    init() {
        let q1 = Question("Who has the world record in the 100?", answer: "Usan Bolt", answerChoices: ["Yohan Blake", "Edward Cheserek", "Austin Powers" ]);
        let q2 = Question("What OS do you need in order to do iOS development with swift?", answer: "MacOS", answerChoices: ["Windows", "Linux", "Google"]);
        let q3 = Question("What does a stitch in time do?", answer: "Saves 9", answerChoices: ["What?", "Is this some sort of joke"]);
        mQuestions = [q1, q2, q3];
        mCurrentIndex = 0;
        mNumberCorrect = 0;
        hasMoreQuestions = true;
        mQuestion = mQuestions[0];
    }
    
    func reset() {
        mCurrentIndex = 0;
        mNumberCorrect = 0;
        hasMoreQuestions = true;
        mQuestions.shuffle();
        for var q in mQuestions {
            q.shuffle();
        }
    }
    
    func getNextQuestion() {
        mQuestion = mQuestions[mCurrentIndex];
        mCurrentIndex = mCurrentIndex + 1;
        hasMoreQuestions = mCurrentIndex < mQuestions.count;
        
    }
    
    
    func isCorrect(row: Int) -> Bool {
        let correct = mQuestion.isCorrect(selection: row);
        if correct {
            mNumberCorrect = mNumberCorrect + 1;
        }
        return correct;
    }
    
    
}
