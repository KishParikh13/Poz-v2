import SwiftUI

struct RateMood: View {
    @State private var speed = 50.0
    
    var body: some View {
        //OnboardThree
        
        VStack {
            
            RateMood_Text()
            
            ZStack {
                ZStack  {
                    if speed >= 90.0 {
                        Text("🤩")
                    } else if speed >= 80.0 && speed < 90.0 {
                        Text("😊")
                    }
                    else if speed >= 70.0 && speed < 80.0 {
                        Text("🙂")
                    }
                    else if speed >= 60.0 && speed < 70.0 {
                        Text("😬")
                    } else if speed >= 50.0 && speed < 60.0 {
                        Text("😐")
                    }
                    else if speed >= 40.0 && speed < 50.0 {
                        Text("😑")
                    }
                    else if speed >= 30.0 && speed < 40.0 {
                        Text("😒")
                    } else if speed >= 20.0 && speed < 30.0 {
                        Text("😓")
                    }
                    else if speed >= 10.0 && speed < 20.0 {
                        Text("😖")
                    }
                    else if speed <= 10.0 {
                        Text("💩")
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
                .offset(x: 150, y: 0)
            }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            // nav button to next screen
           // NavigationLink(destination: EnterThoughts()) {
                        Text("Next")
                            .font(Font.custom("Poppins-Regular", size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .frame(width: 200, height: 50)
                            .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                            .cornerRadius(50)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 60)
           //     }
                
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

struct RateMood_Text: View {
    var body: some View {
        Spacer()
        Text("Rate your mood")
            .font(Font.custom("Blueberry Regular", size: 40))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .padding(.top, 75)
        Text("There's NO wrong answer :)")
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
    }
}
