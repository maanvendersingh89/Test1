//
//  MembersModel.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import Foundation

struct MembersModel : Codable {
    let result : Result?
    let userDetail : [UserDetail]?
    let deviceDetails : [DeviceDetails]?
    let bleTagDetail : [BleTagDetail]?
    let circleDetail : [CircleDetail]?
    let photoList : [String]?
    let myDevice : [String]?
    let myBleTag : [MyBleTag]?
    let checkPoints : String?
    let deletedCheckPoints : [String]?
    let checkPoints_zone : [String]?

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
    let userId : Int?
    let mobileNo : String?
    let name : String?
    let profilePic : String?
    let lat : String?
    let long : String?
    let chatServerID : String?
    let time : String?
    let tsTime : Int?
    let country : String?
    let battery : Int?
    let onlineOffline : String?
    let tsTime1 : Int?
    let transition : Int?
    let isLocationSharingAllowed : Bool?
    let isSoundNotificationAllowed : Bool?
    let permissionOnOff : Bool?
    let permissionOnOffStatusChangedTime_utc : Int?
    let locationsharingStatusChangedTime_utc : Int?
    let onlineOfflineStatus : Bool?
    let gpsOnOffStatusChangedTime_utc : Int?
    let isMemberActive : Int?
    let isSaveMediaFile : Bool?
    let totalTimeSlot : Int?
    let column1 : String?
    let isExpired : Int?
    let showOnHomeScreen : Bool?
    let circleId : Int?

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
    let name : String?
    let userId : String?
    let lat : String?
    let long : String?
    let prvlat : String?
    let prvlng : String?
    let time : String?
    let country : String?
    let battery : Int?
    let onlineOffline : String?
    let aC : String?
    let eng : String?
    let speed : String?
    let engCutStatus : String?
    let isValueAvailable : Bool?
    let isDriverBehaviourAvailable : Bool?
    let status1 : String?
    let status : String?
    let iMEI : String?
    let deviceId : Int?
    let iconType : Int?
    let subscriptionDays : String?
    let sharetype : String?
    let state : String?
    let distance : Double?
    let parkingStatus : Bool?
    let isTrackingSharingAllowed : Int?
    let sharedUserName : String?

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
    let bleTagMacID : String?
    let addedByUserId : Int?
    let shortName : String?
    let lat : Double?
    let lng : Double?
    let markedAsLost : Bool?
    let iconPath : String?
    let iconId : Int?
    let recvTime : Int?
    let locationStatus : Int?
    let bleTagId : Int?
    let addedDate : String?
    let activationDate : String?
    let sharedUserName : String?
    let bleType : String?
    let relayLocStatus : String?
    let relayLockedByUser : String?
    let relayLockedLocation_lat : String?
    let relayLockedLocation_lng : String?
    let isParked : Bool?
    let isAdmin : Int?

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
    let ciecleId : Int?
    let totalTimeSlot : Int?
    let expiredTime : String?
    let circleColorCode : String?
    let circleCode : Int?
    let msgToShare : String?
    let circleName : String?
    let isPersonal : Bool?
    let adminName : String?
    let adminUserId : String?
    let circleType : String?
    let createdSince : Int?
    let isRequestSentToJoin : Bool?
    let isExpired : Bool?

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
    let bleTagMacID : String?
    let addedByUserId : Int?
    let shortName : String?
    let lat : Double?
    let lng : Double?
    let markedAsLost : Bool?
    let iconPath : String?
    let iconId : Int?
    let recvTime : Int?
    let locationStatus : Int?
    let bleTagId : Int?
    let addedDate : String?
    let activationDate : String?
    let sharedUserName : String?
    let bleType : String?
    let relayLocStatus : String?
    let relayLockedByUser : String?
    let relayLockedLocation_lat : String?
    let relayLockedLocation_lng : String?
    let isParked : Bool?
    let isAdmin : Int?

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
