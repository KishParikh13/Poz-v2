//
//  JournalTypes.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/5/21.
//

import SwiftUI

struct BreatheScroller: View {
    let exercises: [BreathingExercise] = [
        BreathingExercise(name: "Simple", emoji: "🌬", color: Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))),
        BreathingExercise(name: "Circle", emoji: "⚪️", color: Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1))),
        BreathingExercise(name: "Square", emoji: "⬜️", color: Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1))),
        BreathingExercise(name: "Guided", emoji: "🗣", color: Color(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1))),
        BreathingExercise(name: "Musical", emoji: "🎼", color: Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1))),
        BreathingExercise(name: "Deep", emoji: "🌊", color: Color(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)))]
    
    var body: some View {
        VStack {
            Text ("Meditations")
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
