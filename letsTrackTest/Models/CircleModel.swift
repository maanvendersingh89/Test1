//
//  CircleModel.swift
//  LetsTrackTest
//
//  Created by Apple on 23/03/23.
//

import Foundation
import UIKit

struct CircleModel: Codable {
    var result: Result?
    var circleCount:Int?
    var circleList: [CircleList]?
    var bleTagList: [BleTagList]?
    var deviceListList: [String]?
    
    enum CodingKeys: String, CodingKey {

        case result = "result"
        case circleCount = "CircleCount"
        case circleList = "CircleList"
        case bleTagList = "BleTagList"
        case deviceListList = "DeviceListList"
    }
    
    
}

struct Result : Codable {
    var code:Int?
    var msg:String?
    var res:String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case msg = "msg"
        case res = "res"
    }

    

}

struct CircleData: Codable{
    var id:Int?
    var circleCount:Int?
    var circleName:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case circleCount = "circleCount"
        case circleName = "circleName"
    }
    
}

struct CircleList : Codable {
    var circleId:Int?
    var circleName:String?
    var circleColorCode:String?
    var circleType:String?
    var isActive:Int?
    var isPersonal:Bool?
    var isExpired:Bool?
    var memberCount:Int?
    var totalTimeSlot:Int?
    var createdDate:Int?
    var noOfVisits:Int?

    enum CodingKeys: String, CodingKey {

        case circleId = "CircleId"
        case circleName = "CircleName"
        case circleColorCode = "CircleColorCode"
        case circleType = "CircleType"
        case isActive = "IsActive"
        case isPersonal = "IsPersonal"
        case isExpired = "IsExpired"
        case memberCount = "MemberCount"
        case totalTimeSlot = "totalTimeSlot"
        case createdDate = "createdDate"
        case noOfVisits = "noOfVisits"
    }
    

}

struct BleTagList : Codable {
    var bleTagId:Int?
    var shortName:String?
    var iconPath:String?
    var iconId:Int?
    var userId:Int?
    var bleTagMacID:String?
    var markedAsLost:Bool?
    var recvTime:Int?
    var locationStatus:Int?

    enum CodingKeys: String, CodingKey {

        case bleTagId = "bleTagId"
        case shortName = "shortName"
        case iconPath = "iconPath"
        case iconId = "iconId"
        case userId = "userId"
        case bleTagMacID = "bleTagMacID"
        case markedAsLost = "markedAsLost"
        case recvTime = "recvTime"
        case locationStatus = "locationStatus"
    }

}
