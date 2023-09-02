//
//  ListWeatherView.swift
//  Sweety Weather
//
//  Created by Igor Kononov on 01.09.2023.
//

import SwiftUI

struct ListWeatherView: View {
    @StateObject var viewModel = ListWeatherViewModel()
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        viewModel.openSettings()
                    } label: {
                        Image("settings_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $viewModel.showSettings) {
            SettingsView()
        }
    }
}

struct ListWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ListWeatherView()
    }
}