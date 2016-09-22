//
//  ExampleDiyDetailController.swift
//  JHB_HUDViewExample
//
//  Created by Leon_pan on 16/8/23.
//  Copyright © 2016年 bruce. All rights reserved.
//

import UIKit

class ExampleDiyDetailController: JHB_HUDTopViewController,UITableViewDelegate,UITableViewDataSource {
    
    var SCREEN_WIDTH = UIScreen.main.bounds.size.width
    var SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    var tableView = UITableView.init()
    var currentImageType = NSInteger()
    let multiStr = " 此生之路，我将走过；走过这一次，便再也无法重来。所有力所能及的善行，所有充盈于心的善意，我将毫不吝惜，即刻倾予。我将不再拖延，再不淡漠，只因此生之路，再也无法重来。"
    var diyimgtype: diyImageType? {
        didSet {
            currentImageType = (diyimgtype?.hashValue)!
        }
    }
    // 声明一个数组,用来储存cell
    var cellArr = NSMutableArray()
    // 标示
    var ID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Diy-Type-Details(HUDType)"
        self.setTableView()
        
        print(currentImageType)
    }
    
    func setTableView() {
        self.tableView = UITableView.init(frame:self.view.bounds)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 注册cell
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: ID)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(self.tableView)
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath)
        cell.textLabel?.numberOfLines = 0
        if (indexPath as NSIndexPath).row == 0 {
            cell.textLabel?.text = "1⃣️Diy-hudType kHUDTypeDefaultly"
        }else if (indexPath as NSIndexPath).row == 1{
            cell.textLabel?.text = "2⃣️Diy-hudType kHUDTypeShowImmediately"
        }else if (indexPath as NSIndexPath).row == 2{
            cell.textLabel?.text = "3⃣️Diy-hudType kHUDTypeShowSlightly"
        }else if (indexPath as NSIndexPath).row == 3{
            cell.textLabel?.text = "4⃣️Diy-hudType kHUDTypeShowFromBottomToTop"
        }else if (indexPath as NSIndexPath).row == 4{
            cell.textLabel?.text = "5⃣️Diy-hudType kHUDTypeShowFromTopToBottom"
        }else if (indexPath as NSIndexPath).row == 5{
            cell.textLabel?.text = "6⃣️Diy-hudType kHUDTypeShowFromLeftToRight"
        }else if (indexPath as NSIndexPath).row == 6{
            cell.textLabel?.text = "7⃣️Diy-hudType kHUDTypeShowFromRightToLeft"
        }else if (indexPath as NSIndexPath).row == 7{
            cell.textLabel?.text = "8⃣️Diy-hudType kHUDTypeScaleFromInsideToOutside"
        }else if (indexPath as NSIndexPath).row == 8{
            cell.textLabel?.text = "9⃣️Diy-hudType kHUDTypeScaleFromOutsideToInside"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            if (indexPath as NSIndexPath).row == 0 {
                self.defaultType()
            }else if (indexPath as NSIndexPath).row == 1{
                self.ShowImmediatelyType()
            }else if (indexPath as NSIndexPath).row == 2{
                self.ShowSlightlyType()
            }else if (indexPath as NSIndexPath).row == 3{
                self.ShowFromBottomToTopType()
            }else if (indexPath as NSIndexPath).row == 4{
                self.ShowFromTopToBottomType()
            }else if (indexPath as NSIndexPath).row == 5{
                self.ShowFromLeftToRightType()
            }else if (indexPath as NSIndexPath).row == 6{
                self.ShowFromRightToLeftType()
            }else if (indexPath as NSIndexPath).row == 7{
                self.ScaleFromInsideToOutsideType()
            }else if (indexPath as NSIndexPath).row == 8{
                self.ScaleFromOutsideToInsideType()
            }
    }
    
    func hide() {
        JHB_HUDView.hideProgressOfDIYType()
    }

    
    func defaultType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeDefaultly)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeDefaultly)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeDefaultly.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
    }
    
    func ShowImmediatelyType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowImmediately)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowImmediately)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeShowImmediately.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ShowSlightlyType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowSlightly)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowSlightly)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeShowSlightly.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ShowFromBottomToTopType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromBottomToTop)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromBottomToTop)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeShowFromBottomToTop.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ShowFromTopToBottomType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromTopToBottom)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromTopToBottom)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeShowFromTopToBottom.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ShowFromLeftToRightType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromLeftToRight)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromLeftToRight)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeShowFromLeftToRight.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ShowFromRightToLeftType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeShowFromRightToLeft)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeShowFromRightToLeft)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeShowFromRightToLeft.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ScaleFromInsideToOutsideType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromInsideToOutside)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeScaleFromInsideToOutside.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    func ScaleFromOutsideToInsideType() {
        if currentImageType == 1 {
            JHB_HUDView.showProgressOfDIYTypeWithAnimation("dropdown_anim_loading", imgsNumber: 8, diySpeed: 0.6, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else if currentImageType == 3 {
            JHB_HUDView.showProgressMsgOfDIYTypeWithAnimation(multiStr as NSString, imgsName: "dropdown_anim_loading", imgsNumber: 8,diySpeed: 0.65, HudType: HUDType.kHUDTypeScaleFromOutsideToInside)
            self.perform(#selector(hide), with: self, afterDelay: 3)
        }else {
            let secondVc = ExampleDiyNDetailController()
            secondVc.currentCoreType = HUDType.kHUDTypeScaleFromOutsideToInside.hashValue
            secondVc.currentImageType = currentImageType
            self.navigationController?.pushViewController(secondVc, animated: true)
        }
        
    }
    
    // 设置header 和 footer
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60))
        header.text = "这一堆HUDType效果类型中的每一种都可以作为实现自定义效果的基础效果显示类型哦~!😊"
        header.sizeToFit()
        header.numberOfLines = 0
        header.textColor = UIColor.white
        header.font = UIFont.systemFont(ofSize: 18)
        header.textAlignment = NSTextAlignment.center
        header.backgroundColor = UIColor.orange
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UILabel.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60))
        footer.text = "是的,点进去还有好多种选择~!😂"
        footer.sizeToFit()
        footer.numberOfLines = 0
        footer.textColor = UIColor.white
        footer.font = UIFont.systemFont(ofSize: 18)
        footer.textAlignment = NSTextAlignment.center
        footer.backgroundColor = UIColor.orange
        return footer
        
    }
    // ❤️ 如果要展示header 或 footer 就必须要设置他们的高度值!
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}
