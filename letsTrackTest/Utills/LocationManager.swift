//
//  LocationManager.swift
//  LetsTrackTest
//
//  Created by Apple on 26/03/23.
//

import Foundation
import UIKit
import CoreLocation
import GoogleMaps

public protocol LocationManagerDelegate : AnyObject{
    func currentLocation(coordinates : CLLocationCoordinate2D)
}


open class LocationManager : NSObject {
    var locationDelegate : LocationManagerDelegate?
    private var locationManager = CLLocationManager()
    private var presentationController : UIViewController?
    static let shared = LocationManager()
        
    public init(controller : UIViewController,locationDelegate : LocationManagerDelegate) {
        super.init()
        self.locationDelegate = locationDelegate
        self.locationManager.delegate = self
        self.locationManager.requestLocation()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.presentationController = controller
    }
    public override init() {}
    func stopUpdatingLocations(){
        self.locationManager.stopUpdatingLocation()
        self.locationManager.delegate = nil
    }
    }


extension LocationManager : CLLocationManagerDelegate{
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let loc = locations.last{
            self.locationDelegate?.currentLocation(coordinates: loc.coordinate)
        }
    }
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
        switch status {
        case .authorizedAlways,.authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
            break
        case .notDetermined:
            self.locationManager.requestLocation()
            self.locationManager.requestWhenInUseAuthorization()
        default:
            self.locationManager.stopUpdatingLocation()
            break
        }
    }
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}



