//
//  CardModel.swift
//  challenge_yourself
//
//  Created by tientran on 29/12/2020.
//

import SwiftUI

struct Card : Identifiable {
    var id = UUID()
    var title : String
    var headLine : String
    var imageName : String
    var callToAction : String
    var message : String
    var gradientColors : [Color]
}
