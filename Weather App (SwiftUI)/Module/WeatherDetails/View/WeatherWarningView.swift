//
//  WeatherWarningView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 10.08.2021.
//

import SwiftUI

struct WeatherWarningView: View {
    var body: some View {
        VStack(spacing: -50) {
            HStack {
                Spacer()
                Image("rain")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 30)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white.opacity(0.2))
                VStack(spacing: 10) {
                    Text("20 minutes ago")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("If you don't want to get wet today, don't forget your umbrella!")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct WeatherWarningView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWarningView()
    }
}
