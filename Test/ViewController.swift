//
//  ViewController.swift
//  Test
//
//  Created by Eric Kang on 3/18/15.
//  Copyright (c) 2015 Eric Kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        var mainView: UIView = self.view
        var alertButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        alertButton.frame = CGRectMake(113, 111, 80, 30)
        alertButton.backgroundColor = UIColor(red: 0.71, green: 0.95, blue: 0.96, alpha: 1.0)
        alertButton.addTarget(self, action: "alertViewDisplay:", forControlEvents: UIControlEvents.TouchUpInside)
        alertButton.setTitle("Alert", forState: UIControlState.Normal)
        alertButton.center = mainView.convertPoint(mainView.center, fromView: mainView.superview)
        mainView.addSubview(alertButton)
        
        var alertLabel: UILabel = UILabel(frame: CGRectInset(alertButton.bounds, 3, 0))
        alertLabel.text = "Alert"
        alertLabel.textAlignment = NSTextAlignment.Center
        alertLabel.textColor = UIColor.blackColor()
        alertButton.addSubview(alertLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonTap(sender: UIButton!){
        var subView: UIView? = sender.superview
        subView?.removeFromSuperview()
    }
    
    func alertViewDisplay(sender:UIButton!){
        let screenSize: CGRect = UIScreen.mainScreen().bounds;
        
        var mainView :UIView = self.view;
        
        /* Containter for pop-out AlertView*/
        var alertContainer :UIView = UIView(frame: CGRectMake(0, 0, 200, 150))
        alertContainer.backgroundColor = UIColorFromRGB(0xFFFFFF)
        alertContainer.center = mainView.convertPoint(mainView.center, fromView: mainView.superview)
        mainView.addSubview(alertContainer)
        
        
        /* Dialog part of AlertView */
        var alertDialog :UIView = UIView(frame: CGRectMake(alertContainer.bounds.origin.x, alertContainer.bounds.origin.y, 200, 80));
        alertDialog.backgroundColor = UIColorFromRGB(0xFFFFFF)
        alertDialog.layer.shadowColor = UIColor.blackColor().CGColor
        alertDialog.layer.shadowOffset = CGSizeMake(0, 5)
        alertDialog.layer.shadowOpacity = 0.3
        alertDialog.layer.shadowRadius = 10
        alertContainer.addSubview(alertDialog)
        
        var alertDialogLabel: UILabel = UILabel(frame: CGRectInset(alertDialog.bounds, 3, 0))
        alertDialogLabel.textAlignment = NSTextAlignment.Center
        alertDialogLabel.text = "Please respond to the message"
        alertDialogLabel.adjustsFontSizeToFitWidth = true
        alertDialog.addSubview(alertDialogLabel)
        
        /* Cancel Button of AlertView */
        var cancelButton :UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        var cancel_x = alertDialog.bounds.origin.x
        var cancel_y:CGFloat = alertDialog.bounds.origin.y + alertDialog.bounds.height + 5
        cancelButton.frame =  CGRectMake(cancel_x, cancel_y, alertDialog.bounds.width/2 - 1, 30)
        cancelButton.backgroundColor = UIColor(red: 0.71, green: 0.95, blue: 0.96, alpha: 1.0)
        cancelButton.addTarget(self, action: "buttonTap:", forControlEvents: UIControlEvents.TouchUpInside);
        alertContainer.addSubview(cancelButton)
        
        var alertLabel :UILabel = UILabel(frame: CGRectInset(cancelButton.bounds, 3, 0))
        alertLabel.text = "Cancel"
        alertLabel.textAlignment = NSTextAlignment.Center
        cancelButton.addSubview(alertLabel)
        
        /* Submit Button of AlertView */
        var submitButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        var submit_x = alertDialog.bounds.origin.x + alertDialog.bounds.width/2
        var submit_y = alertDialog.bounds.origin.y + alertDialog.bounds.height + 5
        submitButton.backgroundColor = UIColorFromRGB(0xC7ED9F)
        submitButton.frame = CGRectMake(submit_x, submit_y, alertDialog.bounds.width/2 - 1, 30)
        submitButton.addTarget(self, action: "buttonTap:", forControlEvents: UIControlEvents.TouchUpInside)
        alertContainer.addSubview(submitButton)
        
        var submitLabel: UILabel = UILabel(frame: CGRectInset(submitButton.bounds, 3, 0))
        submitLabel.textAlignment = NSTextAlignment.Center
        submitLabel.text = "Submit"
        submitButton.addSubview(submitLabel)
        
        
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }



}

