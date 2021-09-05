//
//  LandmarkList.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/1.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoriteOnly=false
    @EnvironmentObject var userData:UserData
    
    var body: some View {
        NavigationView{
            
            List{
                Toggle(isOn:$showFavoriteOnly){
                    Text("只展示收藏")
                }
                ForEach(userData.userLandmarks){landmark in
                        if (!self.showFavoriteOnly || landmark.isFavorite){
                            NavigationLink(destination:LandmarkDetail(landmark: landmark).environmentObject(self.userData)){
                               
                                    LandmarkCell(landamark: landmark)
                            
                                }
                        }
                    }
                    
            }.navigationBarTitle(Text("中国地标"))
        }
       
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12 pro","iPhone 12","iPhone 8"],id: \.self){ deviceName in
            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName).environmentObject(UserData())
            
        }
        
        
    }
}
