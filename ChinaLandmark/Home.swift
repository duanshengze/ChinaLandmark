//
//  Home.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/4.
//

import SwiftUI

struct Home: View {

    
    @EnvironmentObject var userData:UserData
    
    @State var showingProfile = false
    
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
                    CategoryCell(categoryName: categoryName, lankmarks: self.categories[categoryName]!).environmentObject(self.userData)
                }.listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList().environmentObject(self.userData)){
                    Text("查看所有地标")
                }
                
            }.navigationBarTitle(Text("精选"))
            .navigationBarItems(
                trailing:
                    Button(action:{self.showingProfile.toggle()}){
                        Image(systemName: "person.crop.circle")
                            .font(.largeTitle)
                        .padding()
                    }.sheet(isPresented: $showingProfile, content: {
                       Profile()
                    })
                  
            )
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UserData())
    }
}

