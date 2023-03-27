//
//  CircleMapViewModel.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//



import Foundation
import GoogleMaps
protocol CircleMapMemberDelegate: AnyObject {
    func circleMemberDidUpdate()
    
}

protocol MapPinDelegates: NSObject{
    func setMapCenter(center: CLLocationCoordinate2D)
}

class CircleMapViewModel: NSObject {
    
    var clLocationArray = [CLLocationCoordinate2D]()
    var markers = [GMSMarker]()
    var delegate: CircleMapMemberDelegate?
    var mapDelegates: MapPinDelegates?
    private var network : Network!
    var membersModel : MembersModel!
    var mapMarkerModel = MapMarkerModel()
    
    override init() {
        super.init()
        self.network = Network()
        getCircleMemberData()
    }
    
   
    
    
    func getCircleMemberData() {
        self.network.apiToGetCircleMembersData { (membersData) in
            self.membersModel = membersData
            self.delegate?.circleMemberDidUpdate()
        }
    }
    
    func setMapForLocation(){
        for user in self.membersModel.userDetail ?? []{
            let userlat = user.lat ?? ""
            let userLong = user.long ?? ""
            let clLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Double(userlat) ?? 00, longitude: Double(userLong) ?? 00)
            
            clLocationArray.append(clLocation)
        }
        
        for device in self.membersModel.deviceDetails ?? []{
            let userlat = device.lat ?? ""
            let userLong = device.long ?? ""
            let clLocation = CLLocationCoordinate2D(latitude: Double(userlat) ?? 00, longitude: Double(userLong) ?? 00)
            clLocationArray.append(clLocation)
        }
        
        for tag in self.membersModel.myBleTag ?? []{
            let userlat = tag.lat ?? 00
            let userLong = tag.lng ?? 00
            let clLocation = CLLocationCoordinate2D(latitude: Double(userlat), longitude: Double(userLong) )
            clLocationArray.append(clLocation)
        }
        
        self.mapMarkerModel.userDetail = self.membersModel.userDetail ?? []
        self.mapMarkerModel.deviceDetails = self.membersModel.deviceDetails ?? []
        self.mapMarkerModel.myBleTag = self.membersModel.myBleTag ?? []
        self.mapMarkerModel.locationLatLong = clLocationArray
        
        let center = Utils.INSTANCE.geographicMidpoint(betweenCoordinates: clLocationArray)
        self.mapDelegates?.setMapCenter(center: center)
        
        
        
    }
    
    func drawImageWithProfilePic(pp: String, image: UIImage) -> UIImage {
       
        let imgView = UIImageView(image: image)
        imgView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        imgView.contentMode = .scaleAspectFit
        let picImgView = UIImageView(image: UIImage(named: pp))
        
        picImgView.frame = CGRect(x: 0, y: 0, width: 65, height: 65)
        
        imgView.addSubview(picImgView)
        picImgView.center.x = imgView.center.x
        picImgView.center.y = imgView.center.y - 7
        picImgView.layer.cornerRadius = picImgView.frame.width/2
        picImgView.clipsToBounds = true
        picImgView.contentMode = .scaleAspectFit
        if pp != "50car" && pp != "50keys"{
          picImgView.sd_setImage(with: URL(string: pp), placeholderImage: UIImage(named: ""))
        }
        else{
            picImgView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
            picImgView.image = UIImage(named: pp)
        }
        
        imgView.setNeedsLayout()
        picImgView.setNeedsLayout()
        
        let newImage = imageWithView(view: imgView)
        return newImage
    }
    
    func imageWithView(view: UIView) -> UIImage {
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image ?? UIImage()
    }
    
    
    
    func addMarkers(mapView: GMSMapView) {
        self.markers.removeAll()
        for i in 0..<mapMarkerModel.deviceDetails.count {
            let marker = GMSMarker()
            let image = "50car"
            
            marker.icon = self.drawImageWithProfilePic(pp: image, image: UIImage.init(named: "mapPinBackView")!)
            let userlat = mapMarkerModel.deviceDetails[i].lat ?? "0"
            let userLong = mapMarkerModel.deviceDetails[i].long ?? "0"
            let clLocation = CLLocationCoordinate2D(latitude: Double(userlat) ?? 0, longitude: Double(userLong) ?? 0)
            marker.position = clLocation
            markers.append(marker)
        }
        
        for i in 0..<mapMarkerModel.myBleTag.count {
            let marker = GMSMarker()
            let image = "50keys"
            marker.icon = self.drawImageWithProfilePic(pp: image, image: UIImage.init(named: "mapPinBackView")!)
            let userlat = mapMarkerModel.myBleTag[i].lat ?? 00
            let userLong = mapMarkerModel.myBleTag[i].lng ?? 00
            let clLocation = CLLocationCoordinate2D(latitude: Double(userlat), longitude: Double(userLong))
            marker.position = clLocation
            markers.append(marker)
        }
        
       
        
        for i in 0..<mapMarkerModel.userDetail.count {
            let marker = GMSMarker()
            let image = mapMarkerModel.userDetail[i].profilePic ?? ""
            DispatchQueue.main.async { marker.icon = self.drawImageWithProfilePic(pp: image, image: UIImage.init(named: "mapPinBackView")!)
            }
            let userlat = mapMarkerModel.userDetail[i].lat ?? "0"
            let userLong = mapMarkerModel.userDetail[i].long ?? "0"
            let clLocation = CLLocationCoordinate2D(latitude: Double(userlat) ?? 0, longitude: Double(userLong) ?? 0)
            marker.position = clLocation
            markers.append(marker)
        }
        
        for marker in markers {
            marker.map = mapView
        }
    }
    
    
    
}
