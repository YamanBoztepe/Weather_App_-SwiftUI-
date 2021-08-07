//
//  MainHeaderView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 7.08.2021.
//

import SwiftUI

struct MainHeaderView: View {
    let place: String
    
    var body: some View {
        HStack {
            locationBody
            Spacer()
            detailsBody
        }
        .foregroundColor(CustomColor.darkBlue)
        .font(.title2)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
    
    var locationBody: some View {
        HStack(spacing: 15) {
            Button(action: {
                print("Tapped")
            }) {
                Image("placemarker")
            }
            
            Text(place)
                .fontWeight(.semibold)
        }
    }
    
    var detailsBody: some View {
        Button(action: {
            print("Tapped")
        }) {
            Image(systemName: "calendar")
                .renderingMode(.original)
        }
    }
}
