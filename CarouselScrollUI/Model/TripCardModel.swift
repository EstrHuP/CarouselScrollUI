//
//  TripCardModel.swift
//  CarouselScrollUI
//
//  Created by EstrHuP on 23/9/23.
//

import Foundation

struct TripCardModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var tripCards: [TripCardModel] = [
    .init(title: "London", subTitle: "England", image: "Pic 1"),
    .init(title: "New York", subTitle: "USA", image: "Pic 2"),
    .init(title: "Prague", subTitle: "Czech Republic", image: "Pic 3")
]
