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
    
    static func parseJson(_ file: String) -> Quiz {
        print(file);
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: file)) else {
            fatalError("path not valid");
        };
        let json = JSON(data: jsonData);
        print(json);
        var questionList = [Question]();
        let questions =  json["questions"].arrayValue;
        for question in questions {
            let query = question["query"].stringValue;
            let correctAnswer = question["correct_answer"].stringValue;
            let wrongAnswers = question["wrong_answers"].arrayValue.map({$0.stringValue});
            let newQuestion = Question(query, answer: correctAnswer, answerChoices: wrongAnswers);
            questionList.append(newQuestion);
        }
        let newQuiz = Quiz(questionList);
        return newQuiz;
    }
    
}
