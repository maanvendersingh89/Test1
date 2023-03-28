//
//  CircleMapVC.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import Foundation
import UIKit
import GoogleMaps
import FloatingPanel

class CircleMapVC: UIViewController, FloatingPanelControllerDelegate, MapPinDelegates, LocationManagerDelegate {
   
   
    
  
    @IBOutlet weak var mapView: GMSMapView!
    public static let INSTANCE=CircleMapVC()
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    var locationManager : LocationManager?
    var currentLatLong = CLLocationCoordinate2D()
    var image = UIImage()
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    var clPhotoArray = [CLLocationCoordinate2D]()
    var circleList = CircleList()
    var circleMapViewModel = CircleMapViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Data Passed \(circleList.circleName ?? "you")")
        self.locationManager = LocationManager(controller: self, locationDelegate: self)
        self.circleMapViewModel.mapDelegates = self
        self.locationManager?.locationDelegate = self
        self.navigationController?.navigationBar.isHidden = true
        filterBtn.layer.cornerRadius = filterBtn.frame.size.width/2
        settingBtn.layer.cornerRadius = settingBtn.frame.size.width/2
        let floatingPC = FloatingPanelController()
        floatingPC.delegate = self
        floatingPC.behavior = FloatingPanelStocksBehavior()
        floatingPC.leftEge = self.view.leftAnchor
        floatingPC.rightEge = self.view.rightAnchor
        // Initialize FloatingPanelController and add the view
        floatingPC.surfaceView.backgroundColor = UIColor(displayP3Red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        floatingPC.surfaceView.frame = CGRect(x: 20, y: self.view.frame.size.height-floatingPC.surfaceView.frame.size.height, width: self.view.frame.size.width-40, height: floatingPC.surfaceView.frame.size.height)
        floatingPC.surfaceView.appearance.cornerRadius = 10.0
        floatingPC.surfaceView.appearance.shadows = []
        floatingPC.surfaceView.appearance.borderWidth = 1.0 / traitCollection.displayScale
        floatingPC.surfaceView.appearance.borderColor = UIColor.black.withAlphaComponent(0.2)
       
        
        
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "FloatingViewVC") as? FloatingViewVC else {
            return
        }
        
        floatingPC.set(contentViewController: contentVC)
        
        floatingPC.addPanel(toParent: self)
        
//        floatingPC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            floatingPC.surfaceView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: +20.0),
//            floatingPC.surfaceView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0),
//        ])
        
        circleMapViewModel.setMapForLocation()
      
        
        
        locManager.requestWhenInUseAuthorization()
        switch locManager.authorizationStatus {
        case .authorizedAlways , .authorizedWhenInUse:
            guard let currentloc = locManager.location else {
                return
            }
            print(currentloc.coordinate.latitude)
            print(currentloc.coordinate.longitude)
            let locationStart = CLLocationCoordinate2D(latitude: currentloc.coordinate.latitude, longitude: currentloc.coordinate.longitude)
             currentLatLong = locationStart
            locManager.stopUpdatingLocation()
          case .restricted, .denied:
            
            break
            
        default:
            break
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setImageOnMap(notification:)), name: Notification.Name("setImageOnMap"), object: nil)
    }
    
    @objc func setImageOnMap(notification: Notification) {
        let userInfo = notification.object as! [String:Any]
        let strData1 = userInfo["image"] as! UIImage
        //print(mapView,strData1)
        let marker = GMSMarker()
        if mapView != nil{
            let imgView = UIImageView(image: strData1)
            imgView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            imgView.contentMode = .scaleToFill
            let newImage = self.circleMapViewModel.imageWithView(view: imgView)
            marker.icon = newImage
            marker.zIndex = 1
            marker.position = currentLatLong
            marker.map = mapView
        }
        
        
    }
    
    func setMapCenter(center: CLLocationCoordinate2D) {
        mapView.delegate = self
        let camera = GMSCameraPosition.camera(withLatitude: center.latitude, longitude: center.longitude, zoom: 8.0)
        mapView.camera = camera
       
        circleMapViewModel.addMarkers(mapView: mapView)
    }
  

    func currentLocation(coordinates: CLLocationCoordinate2D) {
        switch locManager.authorizationStatus {
        case .authorizedAlways , .authorizedWhenInUse:
            guard let currentloc = locManager.location else {
                return
            }
           let locationStart = CLLocationCoordinate2D(latitude: currentloc.coordinate.latitude, longitude: currentloc.coordinate.longitude)
            currentLatLong = locationStart
            if mapView != nil{
                mapView.isMyLocationEnabled = true
            }
          
            locManager.stopUpdatingLocation()
        case .restricted, .denied:
            
            break
            
        default:
            break
            
        }
        
    }
    
    @IBAction func action_btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
    
}



// MARK: - FloatingPanelBehavior

class FloatingPanelStocksBehavior: FloatingPanelBehavior {
    let springDecelerationRate: CGFloat = UIScrollView.DecelerationRate.fast.rawValue
    let springResponseTime: CGFloat = 0.25
}

