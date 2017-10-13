//
//  Question.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/1/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import Foundation

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

class Question {
    var mQuery: String;
    var mAnswer: String;
    var mAnswerChoices: [String];
    var mAnswerIndex: Int;
    
    init (_ query:String, answer: String, answerChoices: [String]) {
        self.mQuery = query;
        self.mAnswer = answer;
        self.mAnswerChoices = answerChoices;
        mAnswerChoices.append(answer);
        mAnswerChoices.shuffle();
        mAnswerIndex = 0;
        findAnswer();
    }
    
    func shuffle() {
        mAnswerChoices.shuffle();
        findAnswer();
    }
    
    func isCorrect(selection: Int) -> Bool{
        if selection == mAnswerIndex {
            return true;
        } else {
            return false;
        }
    }
    
    func isCorrect(choice: String) -> Bool {
        if (choice == mAnswer) {
            return true;
        } else {
            return false;
        }
    }
    
    func getNumAnswers() -> Int {
        return mAnswerChoices.count;
    }
    
    func getChoice(pos: Int) -> String {
        return mAnswerChoices[pos];
    }
    
    //MARK: Private functions.
    private func findAnswer() {
        for index in 0..<mAnswerChoices.count {
            if (mAnswerChoices[index] == mAnswer) {
                mAnswerIndex = index;
            }
        }
    }
}
