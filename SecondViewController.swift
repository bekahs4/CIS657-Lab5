//
//  SecondViewController.swift
//  Lab03
//
//  Created by Bekah Suttner on 5/19/16.
//  Copyright © 2016 Bekah Suttner and Shiva Madiraju. All rights reserved.
//

import UIKit
import Foundation

class SecondViewController: UIViewController {

    @IBOutlet weak var startLat: UITextField!
    @IBOutlet weak var startLong: UITextField!
    @IBOutlet weak var distanceToTravel: UITextField!
    @IBOutlet weak var bearing: UITextField!
    @IBOutlet weak var endpointLabel: UILabel!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var model = Model()
    
    @IBAction func dismissKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculatePressed(sender: UIButton) {
        let latitude = Double(startLat.text!)!
        let longitude = Double(startLong.text!)!
        let distance = Double(distanceToTravel.text!)!
        let bearing = Double(self.bearing.text!)!
        
        let endpoint = model.computePoint(latitude, longitude: longitude, distance: distance, bearing: bearing)
        
        let endpointLatitude = endpoint.coordinate.latitude
        let endpointLongitude = endpoint.coordinate.longitude
        
        self.endpointLabel.text = "Endpoint: (\(endpointLatitude), \(endpointLongitude))"
    }

    @IBAction func clearPressed(sender: UIButton) {
        self.endpointLabel.text = "Endpoint:"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

