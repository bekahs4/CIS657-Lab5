//
//  Model.swift
//  Lab03
//
//  Created by Bekah Suttner on 5/23/16.
//  Copyright © 2016 Bekah Suttner and Shiva Madiraju. All rights reserved.
//

import Foundation
import CoreLocation

class Model {
    
    // returns the distance between two points
    // return value is in kilometers, rounded to two decimal places
    func distanceBetweenPoints(lat1: Double, long1: Double, lat2: Double, long2: Double) -> Double {
        let location1 = CLLocation(latitude: lat1, longitude: long1)
        let location2 = CLLocation(latitude: lat2, longitude: long2)
        
        // distance in meters
        var distance: Double = location1.distanceFromLocation(location2)
        // distance in kilometers
        distance /= 1000
        // distance rounded to two decimal places
        distance = round(100 * distance) / 100
        
        return distance
    }
    
    // returns the bearing between two points 
    // return value is in degrees, rounded to two decimal places
    func bearingBetweenPoints(lat1: Double, long1: Double, lat2: Double, long2: Double) -> Double {
        let location1 = CLLocation(latitude: lat1, longitude: long1)
        let location2 = CLLocation(latitude: lat2, longitude: long2)
    
        // bearing in degrees
        var bearing: Double = location1.bearingToPoint(location2)
        // bearing rounded to two decimal places
        bearing = round(100 * bearing) / 100
        
        return bearing
    }
    
    // returns the endpoint
    func computePoint(latitude: Double, longitude: Double, distance: Double, bearing: Double) -> CLLocation {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        // CLLocation with the final point
        let endpoint = location.findingPoint(bearing, atDistance: distance)
        
        // round latitude and longitude to 5 decimal places
        let roundedLat = round(100000 * endpoint.coordinate.latitude) / 100000
        let roundedLong = round(100000 * endpoint.coordinate.longitude) / 100000
        
        // create a CLLocation with the ronded latitude and longitude
        let endpointRounded = CLLocation(latitude: roundedLat, longitude: roundedLong)
        
        return endpointRounded
    }
    
}