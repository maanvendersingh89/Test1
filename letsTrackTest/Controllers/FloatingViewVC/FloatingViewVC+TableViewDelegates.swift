//
//  FloatingViewVC+TableViewDelegates.swift
//  LetsTrackTest
//
//  Created by Apple on 26/03/23.
//

import Foundation
import UIKit
import SDWebImage

extension FloatingViewVC: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - UITableview Data Source and Delegate
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 70
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
            let label = UILabel()
            label.frame = CGRect.init(x: 20, y: -10, width: headerView.frame.width-40, height: headerView.frame.height)
            if section == 1{
                label.text = "Shared Devices"
            }
            if section == 2{
                label.text = "Shared Tags"
            }
           
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
            label.textColor = .black
            headerView.addSubview(label)
            headerView.backgroundColor = .clear
            return headerView
        }
        else{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 0))
            return headerView
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else{
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return self.circleMapViewModel.membersModel.userDetail?.count ?? 0
        }
        else if section == 2{
            return self.circleMapViewModel.membersModel.myBleTag?.count ?? 0
        }
        else if section == 1{
            return self.circleMapViewModel.membersModel.deviceDetails?.count ?? 0
        }
        else{
            return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FloatingViewTVCell", for: indexPath) as! FloatingViewTVCell
        if indexPath.section == 0{
            cell.lblMemberName.text = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].name ?? ""
            let timeStampSince = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].tsTime ?? 0
          let timeSince = Utils.INSTANCE.timeStampToDate(time: "\(timeStampSince)")
            let btryStatus = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].battery ?? 0
            cell.lblBtryStatus.text = "\(btryStatus)%"
          cell.lblMemberJoinedFrom.text = "Since \(timeSince)"
            cell.viewBtryBack.isHidden = false
            cell.viewBtryBack.layer.cornerRadius = 6
            let profilePic = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].profilePic ?? ""
            cell.ImgvMainMember.sd_setImage(with: URL(string: profilePic), placeholderImage: UIImage(named: "placeholder"))
            cell.ImgvMainMember.layer.cornerRadius =  cell.ImgvMainMember.frame.size.height/2
            let permissionOnOff = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].permissionOnOff ?? false
            if permissionOnOff {
                let lat = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].lat ?? ""
                let longg = self.circleMapViewModel.membersModel.userDetail?[indexPath.row].long ?? ""
                Utils.INSTANCE.getAddressFromLatLon(pdblLatitude: lat, withLongitude: longg){ (result) in
                    cell.lblMemberLocationStatus.text = result
                    cell.lblMemberLocationStatus.textColor = UIColor.black
                }
            }
            else{
                cell.lblMemberLocationStatus.text = "Location pemission off"
                cell.lblMemberLocationStatus.textColor = UIColor.red
            }
            
        }
        if indexPath.section == 1{
            let name = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].sharedUserName ?? ""
            let deviceName = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].name ?? ""
            cell.lblMemberName.text = "\(deviceName) (\(name)"
            let btryStatus = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].battery ?? 0
            cell.lblBtryStatus.text = "\(btryStatus)%"
            let timeStampSince = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].time ?? ""
          cell.lblMemberJoinedFrom.text = timeStampSince
            cell.viewBtryBack.layer.cornerRadius = 6
            cell.viewBtryBack.isHidden = false
            cell.ImgvMainMember.image = UIImage(named: "50car")
            let onlineOffline = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].onlineOffline ?? "offline"
            if onlineOffline.lowercased() == "online" {
                let lat = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].lat ?? ""
                let longg = self.circleMapViewModel.membersModel.deviceDetails?[indexPath.row].long ?? ""
                Utils.INSTANCE.getAddressFromLatLon(pdblLatitude: lat, withLongitude: longg){ (result) in
                    cell.lblMemberLocationStatus.text = result
                    cell.lblMemberLocationStatus.textColor = UIColor.black
                }
            }
            else{
                cell.lblMemberLocationStatus.text = "Location pemission off"
                cell.lblMemberLocationStatus.textColor = UIColor.red
            }
        }
        if indexPath.section == 2{
            let name = self.circleMapViewModel.membersModel.myBleTag?[indexPath.row].sharedUserName ?? ""
            let deviceName = self.circleMapViewModel.membersModel.myBleTag?[indexPath.row].shortName ?? ""
            cell.lblMemberName.text = "\(deviceName) (\(name)"
            cell.viewBtryBack.isHidden = true
            cell.ImgvMainMember.image = UIImage(named: "50keys")
            let timeStampSince = self.circleMapViewModel.membersModel.myBleTag?[indexPath.row].recvTime ?? 0
          let timeSince = Utils.INSTANCE.timeStampToDate(time: "\(timeStampSince)")
          cell.lblMemberJoinedFrom.text = "Since \(timeSince)"
          

                let lat = self.circleMapViewModel.membersModel.myBleTag?[indexPath.row].lat ?? 00
                let longg = self.circleMapViewModel.membersModel.myBleTag?[indexPath.row].lng ?? 00
                Utils.INSTANCE.getAddressFromLatLon(pdblLatitude: "\(lat)", withLongitude: "\(longg)"){ (result) in
                    cell.lblMemberLocationStatus.text = result
                    cell.lblMemberLocationStatus.textColor = UIColor.black
                }
           
        }
        return cell
    }
    
    
}
