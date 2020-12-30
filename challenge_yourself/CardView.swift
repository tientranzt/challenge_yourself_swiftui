//
//  CardView.swift
//  challenge_yourself
//
//  Created by tientran on 28/12/2020.
//

import SwiftUI

struct CardView: View {
    var card : Card
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State var fadeIn : Bool = false
    @State var forwardDown : Bool = false
    @State var forwardUp : Bool = false
    @State var isShowAlert : Bool = false
    
    var body: some View {
        ZStack{
            
            Image(card.imageName)
            
            LazyVStack{
                
                LazyVStack{
                    Text(card.title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Text(card.headLine)
                        .italic()
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        
                }
                .offset(y: forwardDown ?  -180 :  -230)
                Button(action: {
                    playSound(sound: "sound-chime", type: "mp3")
                    hapticImpact.impactOccurred()
                    isShowAlert.toggle()
                    
                }, label: {
                    LazyHStack{
                        Text(card.callToAction.uppercased())
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        Image(systemName: "arrowshape.turn.up.forward.circle")
                            .font(.title)
                            .accentColor(.white)
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 24)
                    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule(style: .circular))
                    .shadow(color: Color("ColorShadow"), radius: 5, x: 0, y: 3)
                })
                .offset(y: forwardUp ? 180 : 230)
            }
        
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(15)
        .opacity(fadeIn ? 1 : 0)
        .onAppear{
            withAnimation(.linear(duration: 1.0)){
                fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.5)){
                forwardDown.toggle()
            }
            withAnimation(.linear(duration: 0.5)){
                forwardUp.toggle()
            }
        }
        .alert(isPresented : $isShowAlert){
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1]).previewLayout(.sizeThatFits)
    }
}
