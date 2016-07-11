//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    var factsAboutBillAndSteve = [String: [String]]()
    var steveOrBill: String = ""
    var actualFact: String = ""
    var counter: Int = 0
    //this creates a dictionary that will hold key of steve and bill and then will contain an array of facts about each
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billButton.enabled = true
        steveButton.enabled = true
        createFacts()
        showFact()
    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    //since we have an array of facts and the key will be steve or bill
    func createFacts()
    {
        let steveJobsFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        let billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        factsAboutBillAndSteve["Steve Jobs"] = steveJobsFacts
        factsAboutBillAndSteve["Bill Gates"] = billGatesFacts
    }
    
    func getRandomFact()-> (String, String)
    {
        var newString: String = ""
        let newKey = randomPerson()
        let newValue = factsAboutBillAndSteve[newKey]

        if let newValue = newValue
        {
            newString = newValue[randomNumberFromZeroTo(newValue.count)]
        }
        return (newKey, newString)
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    func showFact()
    {
        
        let newFact = getRandomFact()
        steveOrBill = newFact.0
        actualFact = newFact.1
        factLabel.text = actualFact
        print(actualFact)
    }
    
    @IBAction func steveButtonTapped(sender: AnyObject) {
    if steveOrBill == "Steve Jobs"
    {
        counter += 1
        scoreCounter.text = String(counter)
        }
        showFact()
        
    }
    
    @IBAction func billButtonTapped(sender: AnyObject) {
        if steveOrBill == "Bill Gates"
        {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFact()
        
    }
       
    }

