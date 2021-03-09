//
//  HorizontalPicker.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/8/21.
//

import SwiftUI

struct HorizontalPicker: View {
    
    @State private var index: Int = 0
    
    let emojies: [Emoji] = [Emoji(emoji: "", index: 1), Emoji(emoji: "🤩", index: 2), Emoji(emoji: "🥳", index: 3), Emoji(emoji: "😎", index: 4), Emoji(emoji: "😍", index: 5), Emoji(emoji: "😇", index: 6), Emoji(emoji: "🥸", index: 7)]
                            
//, "🤯", "🤠", "😂", "😝", "🥲", "😏", "😊", "☺️", "😌", "🙃", "🙂", "😬", "😐", "😕", "🙁", "☹️", "😟", "😧", "🤒", "🥴", "😩", "😭", "😓", "🙄", "😳", "😵", "🤔", "🥱", "🤢", "😤", "🥵", "🤬"]

    var body: some View {
            
            ScrollView(.horizontal, showsIndicators: false) {
                Text("\(index)")
                HStack {
                    ForEach(emojies, id: \.id) { Emoji in
                        Text(Emoji.emoji)
                            .font(.system(size: 60))
                            .foregroundColor(.black)
                            .frame(width: 80, height: 100)
                            .gesture(TapGesture().onEnded({
                                self.index = Emoji.index
                                
                            }))
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct HorizontalPicker_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalPicker()
    }
}

struct Emoji: Identifiable {
  var id = UUID()
  var emoji: String
  var index: Int
}
