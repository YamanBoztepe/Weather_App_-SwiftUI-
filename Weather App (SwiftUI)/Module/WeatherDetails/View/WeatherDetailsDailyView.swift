//
//  WeatherDetailsDailyView.swift
//  Weather App (SwiftUI)
//
//  Created by Yaman Boztepe on 11.08.2021.
//

import SwiftUI

struct WeatherDetailsDailyView: View {
    var body: some View {
        HStack() {
            Text("Tuesday")
                .foregroundColor(.white)
            Spacer()
            HStack(spacing: 10) {
                Text("25 °")
                    .foregroundColor(.white)
                Text("18 °")
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "cloud")
                .foregroundColor(.white)
        }
        .font(.system(size: 20))
    }
}

struct WeatherDetailsDailyView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsDailyView()
    }
}
