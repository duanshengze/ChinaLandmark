//
//  Profile.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/5.
//

import SwiftUI

struct Profile: View {
    
    @Environment(\.editMode) var mode
    
    @State var profile = User.default
    
    var dateFormatter :DateFormatter{
        let dateFormatter=DateFormatter()
        dateFormatter.dateFormat="yyy年M月d日"
        return dateFormatter
    }
    
    var body: some View {
        VStack(spacing:20) {
            
            
            HStack{
//                if mode?.wrappedValue == .active{
//                    Button(action: {}){
//                        Text("完成")
//                    }
//                }
                Spacer()
                EditButton()
                
            }
           
            if mode?.wrappedValue == .inactive {
                List{
                    Text(profile.username).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    Text("允许通知: \(profile.prefersNotification ? "是" : "否")")
                    Text("喜欢季节: \(profile.preferSession.rawValue)")
                    Text("生日：\(profile.birthday ,formatter: dateFormatter)")
                    VStack(alignment:.leading){
                        Text("最近徒步旅行").font(.headline)
                        HikeView(hike: hikes[0])
                    }
                }
            } else{
                
                List{
                    
                    HStack{
                        Text("昵称").bold()
                        Divider()
                        TextField("昵称",text: $profile.username)
                    
                    }
                    Toggle("是否通知", isOn: $profile.prefersNotification)
                   
                    VStack(alignment:.leading){
                        Text("喜欢的季节").bold()
                        Picker(selection: $profile.preferSession, label: Text("Picker")) {
                            ForEach(User.Season.allCases,id:\.self){ season in
                                Text(season.rawValue).tag(season)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }.padding(.top)
                    
                    
                    VStack(alignment: .leading){
                        Text("生日").bold()
                        DatePicker("生日",selection: $profile.birthday,displayedComponents: .date).datePickerStyle(WheelDatePickerStyle()).labelsHidden()
                    }.padding(.top)
                
                    
                }
                
               
                
            }
            
          
        }.padding()
    
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
