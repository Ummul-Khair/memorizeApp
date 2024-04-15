//
//  ContentView.swift
//  memorizeApp
//
//  Created by Ummul Khair Abdulkarim on 14/04/2024.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂", "🚴‍♀️", "✈️","🏎️","🏎️","🏎️","🏎️"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                    CardView(content: emoji)
                }
                
            }.padding()
                .foregroundColor(.red)
            HStack
            {
                add
                Spacer()
                Spacer()
                remove
            }.padding()
        }
    }
    var remove: some View{
        Button {
            if emojiCount > 1
            {
                emojiCount-=1
            }
        } label:{
            Image(systemName: "minus.circle")
        }
    }
    var add: some View{
        Button{
            if emojiCount < emojis.count
            {
                emojiCount+=1
            }
        } label:{
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{//like a bag of lego
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)//stroke to unfill shape
                Text(content).font(.largeTitle)
            }
            else
            {
                shape.fill()
            }
        }.onTapGesture
        {
              isFaceUp = !isFaceUp
        }
    }
   
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)//can have dark mode, can have two views with dark and light
}
