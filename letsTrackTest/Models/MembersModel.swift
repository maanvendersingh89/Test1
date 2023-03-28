//
//  MembersModel.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import Foundation

struct MembersModel : Codable {
    var result : Result?
    var userDetail : [UserDetail]?
    var deviceDetails : [DeviceDetails]?
    var bleTagDetail : [BleTagDetail]?
    var circleDetail : [CircleDetail]?
    var photoList : [String]?
    var myDevice : [String]?
    var myBleTag : [MyBleTag]?
    var checkPoints : String?
    var deletedCheckPoints : [String]?
    var checkPoints_zone : [String]?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case userDetail = "UserDetail"
        case deviceDetails = "DeviceDetails"
        case bleTagDetail = "BleTagDetail"
        case circleDetail = "CircleDetail"
        case photoList = "PhotoList"
        case myDevice = "MyDevice"
        case myBleTag = "MyBleTag"
        case checkPoints = "checkPoints"
        case deletedCheckPoints = "deletedCheckPoints"
        case checkPoints_zone = "checkPoints_zone"
    }


}

struct UserDetail : Codable {
    var userId : Int?
    var mobileNo : String?
    var name : String?
    var profilePic : String?
    var lat : String?
    var long : String?
    var chatServerID : String?
    var time : String?
    var tsTime : Int?
    var country : String?
    var battery : Int?
    var onlineOffline : String?
    var tsTime1 : Int?
    var transition : Int?
    var isLocationSharingAllowed : Bool?
    var isSoundNotificationAllowed : Bool?
    var permissionOnOff : Bool?
    var permissionOnOffStatusChangedTime_utc : Int?
    var locationsharingStatusChangedTime_utc : Int?
    var onlineOfflineStatus : Bool?
    var gpsOnOffStatusChangedTime_utc : Int?
    var isMemberActive : Int?
    var isSaveMediaFile : Bool?
    var totalTimeSlot : Int?
    var column1 : String?
    var isExpired : Int?
    var showOnHomeScreen : Bool?
    var circleId : Int?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case mobileNo = "MobileNo"
        case name = "Name"
        case profilePic = "ProfilePic"
        case lat = "lat"
        case long = "long"
        case chatServerID = "ChatServerID"
        case time = "Time"
        case tsTime = "tsTime"
        case country = "Country"
        case battery = "Battery"
        case onlineOffline = "OnlineOffline"
        case tsTime1 = "tsTime1"
        case transition = "transition"
        case isLocationSharingAllowed = "IsLocationSharingAllowed"
        case isSoundNotificationAllowed = "IsSoundNotificationAllowed"
        case permissionOnOff = "PermissionOnOff"
        case permissionOnOffStatusChangedTime_utc = "PermissionOnOffStatusChangedTime_utc"
        case locationsharingStatusChangedTime_utc = "LocationsharingStatusChangedTime_utc"
        case onlineOfflineStatus = "OnlineOfflineStatus"
        case gpsOnOffStatusChangedTime_utc = "GpsOnOffStatusChangedTime_utc"
        case isMemberActive = "isMemberActive"
        case isSaveMediaFile = "IsSaveMediaFile"
        case totalTimeSlot = "totalTimeSlot"
        case column1 = "Column1"
        case isExpired = "IsExpired"
        case showOnHomeScreen = "showOnHomeScreen"
        case circleId = "circleId"
    }



}

struct DeviceDetails : Codable {
    var name : String?
    var userId : String?
    var lat : String?
    var long : String?
    var prvlat : String?
    var prvlng : String?
    var time : String?
    var country : String?
    var battery : Int?
    var onlineOffline : String?
    var aC : String?
    var eng : String?
    var speed : String?
    var engCutStatus : String?
    var isValueAvailable : Bool?
    var isDriverBehaviourAvailable : Bool?
    var status1 : String?
    var status : String?
    var iMEI : String?
    var deviceId : Int?
    var iconType : Int?
    var subscriptionDays : String?
    var sharetype : String?
    var state : String?
    var distance : Double?
    var parkingStatus : Bool?
    var isTrackingSharingAllowed : Int?
    var sharedUserName : String?

    enum CodingKeys: String, CodingKey {

        case name = "Name"
        case userId = "UserId"
        case lat = "lat"
        case long = "long"
        case prvlat = "prvlat"
        case prvlng = "prvlng"
        case time = "Time"
        case country = "Country"
        case battery = "Battery"
        case onlineOffline = "OnlineOffline"
        case aC = "AC"
        case eng = "Eng"
        case speed = "Speed"
        case engCutStatus = "EngCutStatus"
        case isValueAvailable = "isValueAvailable"
        case isDriverBehaviourAvailable = "isDriverBehaviourAvailable"
        case status1 = "Status1"
        case status = "status"
        case iMEI = "IMEI"
        case deviceId = "deviceId"
        case iconType = "IconType"
        case subscriptionDays = "subscriptionDays"
        case sharetype = "sharetype"
        case state = "state"
        case distance = "distance"
        case parkingStatus = "ParkingStatus"
        case isTrackingSharingAllowed = "IsTrackingSharingAllowed"
        case sharedUserName = "SharedUserName"
    }

   

}

struct BleTagDetail : Codable {
    var bleTagMacID : String?
    var addedByUserId : Int?
    var shortName : String?
    var lat : Double?
    var lng : Double?
    var markedAsLost : Bool?
    var iconPath : String?
    var iconId : Int?
    var recvTime : Int?
    var locationStatus : Int?
    var bleTagId : Int?
    var addedDate : String?
    var activationDate : String?
    var sharedUserName : String?
    var bleType : String?
    var relayLocStatus : String?
    var relayLockedByUser : String?
    var relayLockedLocation_lat : String?
    var relayLockedLocation_lng : String?
    var isParked : Bool?
    var isAdmin : Int?

    enum CodingKeys: String, CodingKey {

        case bleTagMacID = "bleTagMacID"
        case addedByUserId = "addedByUserId"
        case shortName = "shortName"
        case lat = "lat"
        case lng = "lng"
        case markedAsLost = "markedAsLost"
        case iconPath = "iconPath"
        case iconId = "iconId"
        case recvTime = "recvTime"
        case locationStatus = "locationStatus"
        case bleTagId = "bleTagId"
        case addedDate = "addedDate"
        case activationDate = "activationDate"
        case sharedUserName = "SharedUserName"
        case bleType = "bleType"
        case relayLocStatus = "relayLocStatus"
        case relayLockedByUser = "relayLockedByUser"
        case relayLockedLocation_lat = "relayLockedLocation_lat"
        case relayLockedLocation_lng = "relayLockedLocation_lng"
        case isParked = "isParked"
        case isAdmin = "isAdmin"
    }


}

struct CircleDetail : Codable {
   var ciecleId : Int?
   var totalTimeSlot : Int?
   var expiredTime : String?
   var circleColorCode : String?
   var circleCode : Int?
   var msgToShare : String?
   var circleName : String?
   var isPersonal : Bool?
   var adminName : String?
   var adminUserId : String?
   var circleType : String?
   var createdSince : Int?
   var isRequestSentToJoin : Bool?
   var isExpired : Bool?

    enum CodingKeys: String, CodingKey {

        case ciecleId = "CiecleId"
        case totalTimeSlot = "totalTimeSlot"
        case expiredTime = "ExpiredTime"
        case circleColorCode = "CircleColorCode"
        case circleCode = "CircleCode"
        case msgToShare = "MsgToShare"
        case circleName = "CircleName"
        case isPersonal = "IsPersonal"
        case adminName = "AdminName"
        case adminUserId = "AdminUserId"
        case circleType = "CircleType"
        case createdSince = "CreatedSince"
        case isRequestSentToJoin = "IsRequestSentToJoin"
        case isExpired = "IsExpired"
    }

}

struct MyBleTag : Codable {
    var bleTagMacID : String?
    var addedByUserId : Int?
    var shortName : String?
    var lat : Double?
    var lng : Double?
    var markedAsLost : Bool?
    var iconPath : String?
    var iconId : Int?
    var recvTime : Int?
    var locationStatus : Int?
    var bleTagId : Int?
    var addedDate : String?
    var activationDate : String?
    var sharedUserName : String?
    var bleType : String?
    var relayLocStatus : String?
    var relayLockedByUser : String?
    var relayLockedLocation_lat : String?
    var relayLockedLocation_lng : String?
    var isParked : Bool?
    var isAdmin : Int?

    enum CodingKeys: String, CodingKey {

        case bleTagMacID = "bleTagMacID"
        case addedByUserId = "addedByUserId"
        case shortName = "shortName"
        case lat = "lat"
        case lng = "lng"
        case markedAsLost = "markedAsLost"
        case iconPath = "iconPath"
        case iconId = "iconId"
        case recvTime = "recvTime"
        case locationStatus = "locationStatus"
        case bleTagId = "bleTagId"
        case addedDate = "addedDate"
        case activationDate = "activationDate"
        case sharedUserName = "SharedUserName"
        case bleType = "bleType"
        case relayLocStatus = "relayLocStatus"
        case relayLockedByUser = "relayLockedByUser"
        case relayLockedLocation_lat = "relayLockedLocation_lat"
        case relayLockedLocation_lng = "relayLockedLocation_lng"
        case isParked = "isParked"
        case isAdmin = "isAdmin"
    }
    
    

}
