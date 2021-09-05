//
//  UserData.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/2.
//
import Foundation
import Combine

final class UserData : ObservableObject  {
  @Published  var userLandmarks = landmarks
}
