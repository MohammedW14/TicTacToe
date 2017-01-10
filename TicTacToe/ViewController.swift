//
//  ViewController.swift
//  TicTacToe
//
//  Created by Student on 11/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var lab1: GridLabel!
    @IBOutlet weak var lab2: GridLabel!
    @IBOutlet weak var lab3: GridLabel!
    @IBOutlet weak var lab4: GridLabel!
    @IBOutlet weak var lab5: GridLabel!
    @IBOutlet weak var lab6: GridLabel!
    @IBOutlet weak var lab7: GridLabel!
    @IBOutlet weak var lab8: GridLabel!
    @IBOutlet weak var lab9: GridLabel!
    
    var labelsArray : [GridLabel] = []
    var myGrid = GridLabel()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [lab1, lab2, lab3, lab4, lab5, lab6, lab7, lab8, lab9]
    }
    
    

    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer)
    {
        
        for label in labelsArray
        {
            if label.frame.contains(sender.location(in: gridView))
            {
                if(label.canTap == true)
                {
                    if(myGrid.xTurn == true)
                    {
                        label.text = "X"
                    }
                    else
                    {
                        label.text = "O"
                    
                    }
                    myGrid.xTurn = !myGrid.xTurn
                    label.canTap = false
                    myGrid.count += 1
                    print(myGrid.count)
                }
            }
            checkWinner()
        }
    }
    
        
      
        
        func checkWinner()
        {
            if(lab1.text == lab2.text && lab2.text == lab3.text && lab1.text != "")
            {
                print("Winner")
                win(lab1.text!)
            }
            if(lab4.text == lab5.text && lab6.text == lab5.text && lab4.text != "")
            {
                print("Winner")
                win(lab4.text!)
            }
            if(lab7.text == lab8.text && lab8.text == lab9.text && lab7.text != "")
            {
                print("Winner")
                win(lab7.text!)
            }
            if(lab3.text == lab6.text && lab6.text == lab9.text && lab3.text != "")
            {
                print("Winner")
                win(lab4.text!)
            }
            if(lab2.text == lab5.text && lab5.text == lab8.text && lab2.text != "")
            {
                print("Winner")
                win(lab2.text!)
            }
            if(lab1.text == lab4.text && lab4.text == lab7.text && lab1.text != "")
            {
                print("Winner")
                win(lab1.text!)
            }
            if(lab1.text == lab5.text && lab5.text == lab9.text && lab1.text != "")
            {
                print("Winner")
                win(lab1.text!)
            }
            if(lab3.text == lab5.text && lab5.text == lab7.text && lab3.text != "")
            {
                print("Winner")
                win(lab3.text!)
            }
            if(myGrid.count == 9)
            {
                win("(Cat's Game!!! 😼😼😼)  Nobody ")
            }
        }

        
        
        
        func win(_ winner : String)
        {
            let alert = UIAlertController(title: winner + " is the winner", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            
            let resetButton = UIAlertAction(title: "Restart Game?", style: .default, handler:
                { (sender) in
                    for labels in self.labelsArray
                    {
                        labels.text = ""
                        labels.canTap = true
                    }
                    self.myGrid.count = 0
                    self.myGrid.xTurn = true
            })
            
            alert.addAction(resetButton)
            
            present(alert, animated: true, completion: nil)
        }
}


