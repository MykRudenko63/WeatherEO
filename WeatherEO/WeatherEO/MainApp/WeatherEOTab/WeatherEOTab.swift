//
//  ContentView.swift
//  WeatherEO
//
//  Created by Igor Kononov on 31.08.2023.
//

import SwiftUI

struct WeatherEOTab: View {
    @StateObject var viewModel = WeatherEOTabViewModel()
    
    var body: some View {
        ZStack {
            Color("main_Color")
                TabView(selection: $viewModel.tabWeatherModel) {
                    WeatherTabView()
                        .tag(WeatherEOTabModel.weather)
                    MapView()
                        .tag(WeatherEOTabModel.map)
                    ListWeatherView()
                        .tag(WeatherEOTabModel.list)
                }
                .ignoresSafeArea()
                .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                WeatherBar(viewModel: viewModel)
            }
        }
        .ignoresSafeArea()
    }
}

