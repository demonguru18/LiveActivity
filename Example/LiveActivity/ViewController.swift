//
//  ViewController.swift
//  LiveActivity
//
//  Created by Lyoid Lopes on 12/14/2023.
//  Copyright (c) 2023 Lyoid Lopes. All rights reserved.
//

import UIKit
import ActivityKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Add a label to the view
        let label = UILabel()
        label.text = "Hello, world!"
        label.frame = CGRect(x: 50, y: 100, width: 200, height: 30) // Adjust the frame as needed
        view.addSubview(label)

        // Add a button to start the live activity
        let button = UIButton(type: .system)
        button.setTitle("Start Live Activity", for: .normal)
        button.frame = CGRect(x: 50, y: 150, width: 200, height: 30) // Adjust the frame as needed
        button.addTarget(self, action: #selector(startLiveActivityButtonPressed(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func startLiveActivityButtonPressed(_ sender: UIButton) {
        startLiveActivity()
    }
    
    func startLiveActivity()  {
        UIApplication.shared.registerForRemoteNotifications()
        let center : UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound , .alert , .badge ], completionHandler: { (granted, error) in
            if ((error != nil)) { UIApplication.shared.registerForRemoteNotifications() }
            else {
                
            }
        })
        Task {
            do {
                 let attribute = Widget_LiveActivityAttributes(
                     name: "Bajrangbali"
                 )
                 
                 let contentState = Widget_LiveActivityAttributes.LiveActivityData(
                     emoji: "🤩"
                 )
                 
                 
                 let activity = try Activity<Widget_LiveActivityAttributes>.request(
                     attributes: attribute,
                     contentState: contentState,
                     pushType: .token)
                 for await data in activity.pushTokenUpdates {
                     let token = data.map {String(format: "%02x", $0)}.joined()
                     print("Live Activity Push Token: ", token)
                 }
           }
           catch (let error) {
               print(error.localizedDescription)
           }
        }
    }

}

@available(iOS 16.4, *)
struct Widget_LiveActivityAttributes: ActivityAttributes {
    public typealias LiveActivityData = ContentState
    public struct ContentState: Codable, Hashable {
        var emoji: String
    }
    var name: String
}
