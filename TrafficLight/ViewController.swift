//
//  ViewController.swift
//  TrafficLight
//
//  Created by Vladislav Suslov on 18.09.22.
//

import UIKit


//MARK: EnumOfColors
enum CurrentColor {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    @IBOutlet var startButton: UIButton!
    
    private let lightOn: CGFloat = 1.0
    private let lightOff: CGFloat = 0.3
    private var currentColor = CurrentColor.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.alpha = lightOff
        yellowView.alpha = lightOff
        greenView.alpha = lightOff
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        redView.layer.cornerRadius = redView.frame.height / 2
        yellowView.layer.cornerRadius = yellowView.frame.height / 2
        greenView.layer.cornerRadius = greenView.frame.height / 2
        startButton.layer.cornerRadius = 20
    }

    @IBAction func changeColor() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentColor {
        case .red:
            greenView.alpha = lightOff
            redView.alpha = lightOn
            currentColor = .yellow
        case .yellow:
            redView.alpha = lightOff
            yellowView.alpha = lightOn
            currentColor = .green
        case .green:
            yellowView.alpha = lightOff
            greenView.alpha = lightOn
            currentColor = .red
        }
    }
}

