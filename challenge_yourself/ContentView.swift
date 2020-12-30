//
//  ContentView.swift
//  challenge_yourself
//
//  Created by tientran on 27/12/2020.
//

import SwiftUI

struct ContentView: View {
    var cards : [Card] =  cardData
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack{
                ForEach(cards){ item in
                    CardView(card: item)
                }
            }.padding()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData).previewDevice("iPhone 11 Pro")
    }
}
