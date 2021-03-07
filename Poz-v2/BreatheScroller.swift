//
//  JournalTypes.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/5/21.
//

import SwiftUI

struct BreatheScroller: View {
    let exercises: [BreathingExercise] = [
        BreathingExercise(name: "Simple", emoji: "🌬", color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))),
        BreathingExercise(name: "Circle", emoji: "⚪️", color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
        BreathingExercise(name: "Square", emoji: "⬜️", color: Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))),
        BreathingExercise(name: "Guided", emoji: "🗣", color: Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))),
        BreathingExercise(name: "Musical", emoji: "🎼", color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))),
        BreathingExercise(name: "Deep", emoji: "🌊", color: Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)))]
    
    var body: some View {
        VStack {
            Text ("Breathe")
                .font(Font.custom("Poppins-Regular", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 0)
                .padding(.leading, 16)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 16) {
                    ForEach(exercises,id: \.self) {BreathingExercise in
                        VStack {
                            Text(BreathingExercise.name)
                                .font(Font.custom("Poppins-Regular", size: 24))
                            Text(BreathingExercise.emoji)
                                .font(Font.custom("Poppins-Regular", size: 80))
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 40)
                        .foregroundColor(.white)
                        .background(BreathingExercise.color)
                        .cornerRadius(10.0)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct BreatheScroller_Previews: PreviewProvider {
    static var previews: some View {
        BreatheScroller()
    }
}

struct BreathingExercise: Identifiable, Hashable {
  var id = UUID()
  var name: String
  var emoji: String
  var color: Color
}
