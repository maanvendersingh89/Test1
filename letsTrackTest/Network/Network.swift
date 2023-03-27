//
//  Network.swift
//  LetsTrackTest
//
//  Created by Apple on 23/03/23.
//

import Foundation


class Network :  NSObject {
   
    // fetch data from circle list json
    func apiToGetCircleData(completion : @escaping (CircleModel) -> ()){
      
        if let path = Bundle.main.path(forResource: "circlelist", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
               let circleData = try! jsonDecoder.decode(CircleModel.self, from: data)
                completion(circleData)
              } catch {
                  print("error")
              }
        }
        
        
    }
    
    // fetch data from circle members json
    func apiToGetCircleMembersData(completion : @escaping (MembersModel) -> ()){
      
        if let path = Bundle.main.path(forResource: "circlemember", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
               let circleData = try! jsonDecoder.decode(MembersModel.self, from: data)
                completion(circleData)
              } catch {
                  print("error")
              }
        }
        
        
    }
    
}
