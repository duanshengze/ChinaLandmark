//
//  Home.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/4.
//

import SwiftUI

struct Home: View {

    var categories:[String:[Landmark]]{
        .init(grouping: landmarks, by: {$0.category})
    }
    
    
    var body: some View {
        NavigationView {
            
            List {
                Image(landmarks[0].image)
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self){ categoryName in
                    CategoryCell(categoryName: categoryName, lankmarks: self.categories[categoryName]!)
                }.listRowInsets(EdgeInsets())
                
//                NavigationLink(<#LocalizedStringKey#>, destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/)
                
            }.navigationBarTitle(Text("精选"))
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UserData())
    }
}

