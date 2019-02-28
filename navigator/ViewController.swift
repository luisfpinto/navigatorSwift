//
//  ViewController.swift
//  navigator
//
//  Created by Luis Pinto on 28/02/2019.
//  Copyright © 2019 Luis Pinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    @IBOutlet weak var rectangle: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "openColor") {
            let destination = segue.destination
            destination.view.backgroundColor = rectangle.backgroundColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading stored user data
        let defaults = UserDefaults.standard
        red.value = defaults.float(forKey: "red")
        green.value = defaults.float(forKey: "green")
        blue.value = defaults.float(forKey: "blue")
        rectangle.backgroundColor = UIColor(red: CGFloat(red.value), green: CGFloat(green.value), blue: CGFloat(blue.value), alpha: 1)
        redNumber.text = String(round(red.value*255))
        greenNumber.text = String(round(green.value*255))
        blueNumber.text = String(round(blue.value*255))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateColor() {
        let redValue = CGFloat(red.value)
        let greenValue = CGFloat(green.value)
        let blueValue = CGFloat(blue.value)
        redNumber.text = String(round(red.value*255))
        greenNumber.text = String(round(green.value*255))
        blueNumber.text = String(round(blue.value*255))
//        view.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        rectangle.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        // Saving user preferences
        let defaults = UserDefaults.standard
        defaults.set(red.value, forKey: "red")
        defaults.set(blue.value, forKey: "green")
        defaults.set(green.value, forKey: "blue")
        defaults.synchronize()
    }
    
}

