//
//  ContentView.swift
//  Bollie-iOS
//
//  Created by Silvan on 12/14/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack(spacing: 20) {
                CityTextView(cityName: "Amsterdam, NL")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 23)
                HStack(spacing: 30) {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        weatherIconName: "cloud.sun.fill",
                        temperature: 10)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        weatherIconName: "sun.max.fill",
                        temperature: 30)
                    WeatherDayView(
                        dayOfWeek: "THU",
                        weatherIconName: "wind.snow",
                        temperature: -5)
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        weatherIconName: "cloud.bolt.fill",
                        temperature: 16)
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        weatherIconName: "tornado",
                        temperature: 6)
                }
                
                Spacer()
                
                WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var weatherIconName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: weatherIconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button {
            print("tapped")
        } label: {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
    }
}
