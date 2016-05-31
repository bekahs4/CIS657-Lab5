//
//  FirstViewController.swift
//  Lab03
//
//  Created by Bekah Suttner on 5/19/16.
//  Copyright © 2016 Bekah Suttner and Shiva Madiraju. All rights reserved.
//

import UIKit
import Foundation

extension UITabBarController {
    override public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }
}

class FirstViewController: UIViewController {
    
    @IBOutlet weak var pointOneLat: UITextField!
    @IBOutlet weak var pointOneLong: UITextField!
    @IBOutlet weak var pointTwoLat: UITextField!
    @IBOutlet weak var pointTwoLong: UITextField!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var bearingLabel: UILabel!
    
    var model: Model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func calculatePressed(sender: UIButton) {
        let firstLat = Double(pointOneLat.text!)!
        let firstLong = Double(pointOneLong.text!)!
        let secondLat = Double(pointTwoLat.text!)!
        let secondLong = Double(pointTwoLong.text!)!
        
        let distance = model.distanceBetweenPoints(firstLat, long1: firstLong, lat2: secondLat, long2: secondLong)
        
        let bearing = model.bearingBetweenPoints(firstLat, long1: firstLong, lat2: secondLat, long2: secondLong)
        
        self.distanceLabel.text = "Distance: \(distance) kilometers"
        self.bearingLabel.text = "Bearing: \(bearing) degrees"
    }
    
    @IBAction func clearPressed(sender: UIButton) {
        self.distanceLabel.text = "Distance:"
        self.bearingLabel.text = "Bearing:"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

