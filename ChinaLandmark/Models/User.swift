//
//  User.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/5.
//

import Foundation

struct User {
    
    var username :String
    var prefersNotification = true
    var preferSession = Season.winter
    
    var birthday = Date()
    
    //单例模式
    static let `default` = Self(username: "dsz")
    
    enum Season :String,CaseIterable {
        case spring = "🌹"
        case summer = "☀️"
        case autumn = "🌰"
        case winter = "⛄️"
    }
    
    
    
}
