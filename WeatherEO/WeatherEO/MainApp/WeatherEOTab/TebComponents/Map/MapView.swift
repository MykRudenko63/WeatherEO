//
//  MapView.swift
//  Sweety Weather
//
//  Created by Igor Kononov on 31.08.2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var viewModel = MapViewModel()
    @FocusState var focus: Bool
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region)
            
            VStack {
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .frame(height: 110)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        
                        Rectangle()
                            .foregroundColor(Color("green_Color"))
                            .frame(height: 105)
                            .cornerRadius(20)
                    }
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(height: 38)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                            
                            HStack {
                                TextField("Search..", text: $viewModel.searchText)
                                    .focused($focus)
                                Spacer()
                                
                                Button {
                                    withAnimation {
                                        focus = false
                                        viewModel.tapCancel()
                                    }
                                } label: {
                                    Image("cancel_icon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 28)
                                        .opacity(viewModel.searchText.isEmpty ? 0.5 : 1)
                                }
                                .disabled(viewModel.searchText.isEmpty)
                            }
                            .padding(.horizontal)
                        }
                        Button {
                            viewModel.tapSerch()
                        } label: {
                            Image("serch_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 38)
                                .opacity(viewModel.searchText.isEmpty ? 0.5 : 1)
                        }
                        .disabled(viewModel.searchText.isEmpty)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                Spacer()
            }
        }
        .onTapGesture {
            focus = false
        }
        .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
