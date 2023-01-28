//
//  ViewController.swift
//  UIKit Lesson 3 - Alert Game
//
//  Created by Валентин Ремизов on 01.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeOutlet: UILabel!
    @IBOutlet weak var sumTotalOutlet: UILabel!
    @IBOutlet weak var resultGameGuessOutler: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        welcomeOutlet.text = "Welcome, "
        let alertController = UIAlertController(title: "Welcome", message: "Please, write your name.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            let name = alertController.textFields?.first?.text
            self.welcomeOutlet.text! += name ?? ""
        }


        alertController.addAction(alertAction)
        self.present(alertController, animated: true)

        alertController.addTextField()
    }

    @IBAction func sumButton(_ sender: UIButton) {
        self.sumTotalOutlet.text = "Sum = "
        let alertController = UIAlertController(title: "Hi", message: "Please write two the number", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Calculate", style: .default) { _ in
            let numberOne = alertController.textFields?[0].text
            let numberTwo = alertController.textFields?[1].text
            self.sumTotalOutlet.text! += String((Int(numberOne ?? "") ?? 0) + (Int(numberTwo ?? "") ?? 0))

        }

        alertController.addAction(alertAction)
        self.present(alertController, animated: true)

        alertController.addTextField()
        alertController.addTextField()
    }


    @IBAction func guessNumberButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Are you ready?", message: "If you are ready - write number from 1 to 10", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "I'll guess!", style: .default) { _ in
            let randomNumber = Int.random(in: 1...10)
            let numberUser = alertController.textFields?.first?.text

            if randomNumber == Int(numberUser ?? "") {
                self.resultGameGuessOutler.text = "Yohoo! You are win!"
            } else {
                self.resultGameGuessOutler.text = "Haha! You are loser!"
            }

//            randomNumber == Int(numberUser ?? "") ? self.resultGameGuessOutler.text = "Yohoo! You are win! I congratulate you!" : self.resultGameGuessOutler.text = "Haha! You are loser!"
            //Не пойму тернарный оператор не работает в примере выше

        }

        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
        //Этой строчкой мы показываем наш alert и выбираем анимацией показывать или нет.

        alertController.addTextField()
        //Этой строчкой мы добавляем окошко для ввода текста юзера.
    }

}

//FIRST TASK WITH SUM READY! REMAINED TWO PART TASK WITH GUESS NUMBER AND TWO TASK!
