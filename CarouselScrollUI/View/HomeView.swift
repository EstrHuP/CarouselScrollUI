//
//  HomeView.swift
//  CarouselScrollUI
//
//  Created by EstrHuP on 23/9/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct HomeView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                HStack(spacing: 12) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.blue)
                    })
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("Search", text: $searchText)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial, in: .capsule)
                }
                
                Text("Where do you want to \ntravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.top, 10)
                
                /// Parallax carousel
                GeometryReader { geometry in
                    let size = geometry.size
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(tripCards) { card in
                                // In order to move the card in reverse direction (Parallax efect)
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: cardSize.width,
                                               height: cardSize.height)
                                        .clipShape(.rect(cornerRadius: 20))
                                        .shadow(color: .black.opacity(0.25),
                                                radius: 8,
                                                x: 5,
                                                y: 10)
                                }
                                // Adjust frame of cards
                                .frame(width: size.width - 60,
                                       height: size.height - 50)
                                
                                /// Scroll Animation
                                .scrollTransition(.interactive,
                                                  axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.75)
                                }
                            }
                        }
                        // Adjust leading margin
                        .padding(.horizontal, 30)
                        //only for ios 17
                        .scrollTargetLayout()
                        // Adjust cards shadow
                        .frame(height: size.height,
                               alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                }
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
