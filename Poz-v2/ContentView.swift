import SwiftUI

struct ContentView: View {
    @State var index = 0
    @State private var isWelcomeScreensShowing = false;
    @State private var isEnterNameScreenShowing = false;
    
    var body: some View {
        VStack {
            if (isWelcomeScreensShowing == true) {
                    Onboarding()
                    Button(action: {isWelcomeScreensShowing = false}) {
                        Text("Get Started")
                            .font(Font.custom("Poppins-Regular", size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .frame(width: 200, height: 50)
                            .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                            .cornerRadius(50)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 60)
                    }

            } else {
                
                if (isEnterNameScreenShowing == true) {
                    EnterName()
                    Button(action: {isEnterNameScreenShowing = false}) {
                            Text("Next")
                                .font(Font.custom("Poppins-Regular", size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .frame(width: 200, height: 50)
                                .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                                .cornerRadius(50)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 60)
                    }
                } else {
                    if (self.index == 0) {
                        Spacer()
                    }
                    if (self.index == 2) {
                        Dashboard()
                    }
            bottomTabs(index: self.$index)
        }
    }
    
}
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
