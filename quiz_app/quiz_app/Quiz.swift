//
//  Quiz.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/6/17.
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

class Quiz {
    var mQuestions: [Question];
    var mCurrentIndex: Int;
    
    init() {
        let q1 = Question("Who has the world record in the 100?", answer: "Usan Bolt", answerChoices: ["Yohan Blake", "Edward Cheserek", "Austin Powers" ]);
        let q2 = Question("What OS do you need in order to do iOS development with swift?", answer: "MacOS", answerChoices: ["Windows", "Linux", "Google"]);
        let q3 = Question("What does a stitch in time do?", answer: "Saves 9", answerChoices: ["What?", "Is this some sort of joke"]);
        mQuestions.append(q1);
        mQuestions.append(q2);
        mQuestions.append(q3);
        mCurrentIndex = 0;
    }
    
}
