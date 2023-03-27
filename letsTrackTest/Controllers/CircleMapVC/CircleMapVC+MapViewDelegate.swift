//
//  CircleMapVC+MapViewDelegate.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import Foundation
import GoogleMaps

 
extension CircleMapVC: GMSMapViewDelegate{
    /* handles Info Window tap */
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf")
    }
    
    /* handles Info Window long press */
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }

}
