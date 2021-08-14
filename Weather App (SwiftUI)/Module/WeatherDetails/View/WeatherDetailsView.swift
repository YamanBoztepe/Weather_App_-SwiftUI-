//
//  WeatherDetailsView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 10.08.2021.
//

import SwiftUI

struct WeatherDetailsView: View {
    let place: String
    
    var body: some View {
        ZStack {
            CustomColor.darkGray
                .ignoresSafeArea()
            VStack {
                warningBody
                dailyBody
            }
        }
        .navigationBarTitle(place, displayMode: .inline)
        .setDarkNavigationBar()
    }
    
    var warningBody: some View {
        TabView {
            ForEach(0 ..< 3) { _ in
                WeatherWarningView()
                    .frame(height: 250)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear() {
            UIScrollView.appearance().alwaysBounceVertical = false
        }
    }
    
    var dailyBody: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Next Week")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
                Spacer()
            }
            List {
                ForEach(0 ..< 20) { _ in
                    WeatherDetailsDailyView()
                }
                .listRowBackground(Color.clear)
            }.onAppear() {
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
            }
        }
    }
    
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(place: "Istanbul")
    }
}
