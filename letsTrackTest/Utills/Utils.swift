//
//  Utils.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import Foundation
import CoreLocation


public class Utils: NSObject {
    public static let INSTANCE=Utils()
    
    func timeStampToDate(time: String)->String{
        let timeInterval = TimeInterval(time) ?? 0
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd MMM yyyy hh:mm a" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String,completion: @escaping  (String) -> Void) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        //21.228124
        let lon: Double = Double("\(pdblLongitude)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
                                    {(placemarks, error) in
            if (error != nil)
            {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            }
            let pm = placemarks! as [CLPlacemark]
            
            if pm.count > 0 {
                let pm = placemarks![0]
                var addressString : String = ""
                if pm.subLocality != nil {
                    addressString = addressString + pm.subLocality! + ", "
                }
                if pm.thoroughfare != nil {
                    addressString = addressString + pm.thoroughfare! + ", "
                }
                if pm.locality != nil {
                    addressString = addressString + pm.locality! + ", "
                }
                if pm.country != nil {
                    addressString = addressString + pm.country! + ", "
                }
                if pm.postalCode != nil {
                    addressString = addressString + pm.postalCode! + " "
                }
                print(addressString)
                completion(addressString)
            }
        })
        
        
    }
    
    //        /** Degrees to Radian **/
    func degreeToRadian(angle:CLLocationDegrees) -> CGFloat {
        return (  (CGFloat(angle)) / 180.0 * CGFloat(M_PI)  )
    }

    //        /** Radians to Degrees **/
    func radianToDegree(radian:CGFloat) -> CLLocationDegrees {
        return CLLocationDegrees(  radian * CGFloat(180.0 / M_PI)  )
    }
    
    func geographicMidpoint(betweenCoordinates coordinates: [CLLocationCoordinate2D]) -> CLLocationCoordinate2D {
        
        guard coordinates.count > 1 else {
            return coordinates.first ?? // return the only coordinate
            CLLocationCoordinate2D(latitude: 0, longitude: 0) // return null island if no coordinates were given
        }
        
        var x = Double(0)
        var y = Double(0)
        var z = Double(0)
        
        for coordinate in coordinates {
            var lat = degreeToRadian(angle: coordinate.latitude)
            var lon = degreeToRadian(angle: coordinate.longitude)
            x += cos(lat) * cos(lon)
            y += cos(lat) * sin(lon)
            z += sin(lat)
        }
        
        x /= Double(coordinates.count)
        y /= Double(coordinates.count)
        z /= Double(coordinates.count)
        
        let lon = atan2(y, x)
        let hyp = sqrt(x * x + y * y)
        let lat = atan2(z, hyp)
        var newLat = radianToDegree(radian: lat)
        var newLon = radianToDegree(radian: lon)
        
        return CLLocationCoordinate2D(latitude: newLat, longitude:newLon)
    }
    

   
}


