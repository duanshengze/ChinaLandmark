//
//  LandmarkDetail.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/1.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var userData:UserData
    
    let landmark :Landmark
    
    var landmarkIndex: Int{
        userData.userLandmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
   
    
    var body: some View {
        VStack {
            MapView(center: landmark.locationCoordinate).edgesIgnoringSafeArea(.top).frame(height: 350)
            Image(landmark.image)
                .resizable()
                .frame(width: 250,height:250)
                .clipShape(Circle())
                .overlay(Circle()
                .stroke(Color.white,lineWidth: 4.0))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).offset(x:0,y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment: .leading, spacing:8) {
                HStack {
                    Text(landmark.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Button(action:{
                        self.userData.userLandmarks[self.landmarkIndex].isFavorite.toggle()
                        
                    }){
                        
                        if userData.userLandmarks[self.landmarkIndex].isFavorite{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        }else{
                            Image(systemName: "star").foregroundColor(.gray)
                        }
                       
                    }
                }
                HStack {
                    Text(landmark.city)
                    Spacer()
                    Text(landmark.province)
                }
            }.padding()
            Spacer()
        }.navigationBarTitle(Text(landmark.name),displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkDetail(landmark: landmarks[1]).environmentObject(UserData())
        }
    
    }
}
