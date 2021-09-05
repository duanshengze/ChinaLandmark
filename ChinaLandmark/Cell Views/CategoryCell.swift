//
//  CategoryCell.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/4.
//

import SwiftUI

struct CategoryCell: View {

    let categoryName:String 
    let lankmarks:[Landmark]
    
    
    
    var body: some View {
      
       
            VStack(alignment:.leading){
                Text(categoryName).font(.headline).padding(.leading)
                ScrollView(.horizontal,showsIndicators:false) {
                    HStack(spacing:15) {
                        ForEach(lankmarks){ landmark in
                            NavigationLink(destination:LandmarkDetail(landmark: landmark)){
                                CategoryItem(landmark: landmark)
                                
                            }
                         
                        }
                    }.frame( height: 180).padding(.leading)
                    
                }
            }.padding(.top)
        
        
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(categoryName: landmarks[0].category, lankmarks: Array(landmarks.prefix(4)))
    }
}

struct CategoryItem: View {
    let landmark:Landmark
    var body: some View {
        
            VStack(alignment:.leading){
                Image(landmark.image).resizable().frame(width: 155, height: 155).cornerRadius(5.0)
                Text(landmark.name).font(.caption).foregroundColor(.gray)
            }.padding(.bottom)
    
        
    }
}
