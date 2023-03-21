//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var labelScore: UILabel!

    var quizBrain = QuizBrain()
//    let totalQuiz = quizBrain.getTotalQuiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBarCount()
        trueButton.layer.cornerRadius = 15
        falseButton.layer.cornerRadius = 15
        
        scoreLabel()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        var isTrue = quizBrain.checkAnswer(answer: userAnswer)
        
        
        if isTrue{
            print("Right!")
            sender.backgroundColor = UIColor.green
            quizBrain.addScore()
            scoreLabel()
        
        } else{
            print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.getQuestionNumber() + 1 < quizBrain.getTotalQuiz(){
            quizBrain.setQuizNumber(num: 1)
        } else {
            quizBrain.setQuizNumber(num: 0)
            scoreLabel()
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBarCount()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    func progressBarCount(){
        progressBar.progress = Float(quizBrain.getQuestionNumber()+1)/Float(quizBrain.getTotalQuiz())
    }
    
    func scoreLabel(){
        labelScore.text = "Score: \(quizBrain.score)"
    }
    
}

