//
//  ContentView.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/1.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Home().environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
