//
//  ViewController.swift
//  CardGame
//
//  Created by Sara Petrovic on 05/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var cpuScore: UILabel!
    
    var playerScoreCount = 0
    var cpuScoreCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func deal(_ sender: Any) {
        
        let random1 = Int.random(in: 2...14)
        let random2 = Int.random(in: 2...14)
        leftImageView.image = UIImage(named: "card\(random1)")
        rightImageView.image = UIImage(named: "card\(random2)")
        
        if random1 > random2 {
            playerScoreCount += 1
            playerScore.text = "\(playerScoreCount)"
        } else if random2 > random1{
            cpuScoreCount += 1
            cpuScore.text = "\(cpuScoreCount)"
        } else {
            self.showToast(message: "It's a draw, try again!", seconds: 1.0)
        }
    }
    
}

extension UIViewController{

func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
 }
