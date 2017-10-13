//
//  QuizViewController.swift
//  quiz_app
//
//  Created by Jordan Burton on 10/5/17.
//  Copyright © 2017 Jordan Burton. All rights reserved.
//

import UIKit

class QuizViewController: UITableViewController {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mQueryView: UITextView!
    @IBOutlet weak var mQueryText: UITextView!
    @IBOutlet weak var mAnswerTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
    @IBAction func goBack(_ sender: UIBarButtonItem) {
         print("I like cake");
        _ = self.navigationController?.popViewController(animated: true);

    }
    
    func back(sender: UIBarButtonItem) {
        _ = self.navigationController?.popViewController(animated: true);

    }

}
