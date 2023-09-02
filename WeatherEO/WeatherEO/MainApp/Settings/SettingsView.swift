//
//  SettingsView.swift
//  WeatherEO
//
//  Created by Igor Kononov on 31.08.2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = SettingsViewModel()
    var body: some View {
        ZStack {
            Color("green_Color")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image("exit_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 55)
                    }
                    .padding()
                }
                Spacer()
            }
            
            VStack {
                ForEach(viewModel.arraySettingsModel) { cell in
                    ZStack {
                        Rectangle()
                            .frame(width: ScreenSize.width * 0.7 + 3, height: 63)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                        Button {
                            if cell == .rateApp {
                                requestReview()
                            }
                            viewModel.clickButton(cell)
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color("main_Color"))
                                    .cornerRadius(20)
                                HStack {
                                    Image(cell.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 35)
                                        .padding(.trailing)
                                    
                                    Text(cell.name)
                                        .foregroundColor(.black)
                                        .bold()
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            .frame(width: ScreenSize.width * 0.7, height: 60)
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShareSheetPresented) {
                ShareView(shareText: viewModel.shareText)
            }
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}