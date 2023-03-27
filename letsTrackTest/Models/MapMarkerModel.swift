//
//  MapMarkerModel.swift
//  LetsTrackTest
//
//  Created by Apple on 26/03/23.
//

import Foundation
import CoreLocation

struct MapMarkerModel {
    var locationLatLong = [CLLocationCoordinate2D]()
    var userDetail = [UserDetail]()
    var deviceDetails = [DeviceDetails]()
    var bleTagDetail = [BleTagDetail]()
    var circleDetail = [CircleDetail]()
    var myBleTag = [MyBleTag]()

}
