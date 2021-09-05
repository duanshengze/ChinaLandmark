//
//  LandmarkCell.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/1.
//

import SwiftUI

struct LandmarkCell: View {
    let landamark:Landmark
    var body: some View {
        HStack(spacing:10){
            Image(landamark.image)
                .resizable()
                .frame(width:50,height:50)
                .cornerRadius(8)
            
            Text(landamark.name)
            Spacer()
            
            if (landamark.isFavorite){
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .imageScale(.medium)
            }
        }
    }
}

struct LandmarkCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkCell(landamark: landmarks[0])
            LandmarkCell(landamark: landmarks[1])
            LandmarkCell(landamark: landmarks[2])
        }.previewLayout(.fixed(width: 300, height: 70))

    }
}
