//
//  MapView.swift
//  ChinaLandmark
//
//  Created by dsz on 2021/9/1.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable{
    
    let center :CLLocationCoordinate2D
    
    
    func makeUIView(context: Context) -> MKMapView {
         MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
 
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta:0.001);
    
        uiView.setRegion(MKCoordinateRegion(center:center,span:span),animated: true)
    }
   
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(center:CLLocationCoordinate2D(latitude:39.899,longitude:116.3915))
    }
}
