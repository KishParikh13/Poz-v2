import SwiftUI

struct RateMood: View {
    @State private var speed = 50.0
    @State private var emoji: String = "🤩"
    
    var body: some View {
        //OnboardThree
        
        VStack {
            
            Text("Rate your mood")
                .foregroundColor(Color.gray)
            
            ZStack {
                ZStack  {
                    if speed >= 90.0 {
                        Text("🤩")
//                        self.emoji = "🤩"
                    } else if speed >= 80.0 && speed < 90.0 {
                        Text("😊")
//                        emoji = "🤩"
                    }
                    else if speed >= 70.0 && speed < 80.0 {
                        Text("🙂")
//                        emoji = "🤩"
                    }
                    else if speed >= 60.0 && speed < 70.0 {
                        Text("😬")
//                        emoji = "🤩"
                    } else if speed >= 50.0 && speed < 60.0 {
                        Text("😐")
//                        emoji = "🤩"
                    }
                    else if speed >= 40.0 && speed < 50.0 {
                        Text("😑")
//                        emoji = "🤩"
                    }
                    else if speed >= 30.0 && speed < 40.0 {
                        Text("😒")
//                        emoji = "🤩"
                    } else if speed >= 20.0 && speed < 30.0 {
                        Text("😓")
//                        emoji = "🤩"
                    }
                    else if speed >= 10.0 && speed < 20.0 {
                        Text("😖")
//                        emoji = "🤩"
                    }
                    else if speed <= 10.0 {
                        Text("💩")
//                        emoji = "🤩"
                    }
                }
                .font(Font.custom("Blueberry Regular", size: 200))
                .offset(x: 0, y: 0)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { value in
                        let verticalAmount = value.translation.height as CGFloat
                            speed -= (Double(verticalAmount))/100
                    })

                Slider(
                    value: $speed,
                    in: 0...100
                )
                .rotationEffect(.degrees(-90))
                .accentColor(Color(#colorLiteral(red: 0.8941222429, green: 0.8940448165, blue: 0.9026284814, alpha: 1)))
                .offset(x: 250, y: -50)
                .scaleEffect(0.6)
            }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
    }
}

struct RateMood_Previews: PreviewProvider {
    static var previews: some View {
        RateMood()
    }
}
