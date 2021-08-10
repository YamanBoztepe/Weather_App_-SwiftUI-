//
//  DailyWeatherView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 10.08.2021.
//

import SwiftUI

struct DailyWeatherView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Today, 18 Sep")
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white.opacity(0.2))
                VStack(spacing: 20) {
                    Text("9:00 AM")
                        .font(.subheadline)
                        .padding(.top, 15)
                    Image(systemName: "cloud")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                    Text("28 °")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .padding(.bottom, 15)
                }
            }
        }
        .foregroundColor(CustomColor.darkBlue)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView()
    }
}
