//
//  CircleModel.swift
//  LetsTrackTest
//
//  Created by Apple on 23/03/23.
//

import Foundation
import UIKit

struct CircleModel: Codable {
    let result: Result?
    let circleCount:Int?
    let circleList: [CircleList]?
    let bleTagList: [BleTagList]?
    let deviceListList: [String]?
    
    enum CodingKeys: String, CodingKey {

        case result = "result"
        case circleCount = "CircleCount"
        case circleList = "CircleList"
        case bleTagList = "BleTagList"
        case deviceListList = "DeviceListList"
    }
    
    
}

struct Result : Codable {
    let code:Int?
    let msg:String?
    let res:String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case msg = "msg"
        case res = "res"
    }

    

}

struct CircleData: Codable{
    let id:Int?
    let circleCount:Int?
    let circleName:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case circleCount = "circleCount"
        case circleName = "circleName"
    }
    
}

struct CircleList : Codable {
    let circleId:Int?
    let circleName:String?
    let circleColorCode:String?
    let circleType:String?
    let isActive:Int?
    let isPersonal:Bool?
    let isExpired:Bool?
    let memberCount:Int?
    let totalTimeSlot:Int?
    let createdDate:Int?
    let noOfVisits:Int?

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
    let bleTagId:Int?
    let shortName:String?
    let iconPath:String?
    let iconId:Int?
    let userId:Int?
    let bleTagMacID:String?
    let markedAsLost:Bool?
    let recvTime:Int?
    let locationStatus:Int?

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
