import SwiftUI


class User : ObservableObject {
    @Published var name = ""
}


struct ContentView: View {
    
    //vars to control which screen/tab is showing
    @State var index = 0
    @State private var isWelcomeScreensShowing = false; //enter name screen
    @State private var isEnterNameScreenShowing = false; //enter name screen

    @State public var addNoteShowing = false;
    
    let user = User()
    
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

            } else { //Onoarding Screen
                
                if (isEnterNameScreenShowing == true) {
                    EnterName().environmentObject(user)
         
                    ZStack {
                        Button(action: {
                            isEnterNameScreenShowing = false
                        }) {
                                Text("Next")
                                    .font(Font.custom("Poppins-Regular", size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                    .frame(width: 200, height: 50)
                                    .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                                    .cornerRadius(50)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 60)
                        }
                        Button (action: {isEnterNameScreenShowing = false}, label: {Text("Skip")})
                            .offset(x: 150, y: -30)
                        
                    }
                    
                } else { // Enter name screen
                    
                    if (self.index == 0) {
                        
                        
                        VStack {
                            Spacer()
                            
                            userNameOutput().environmentObject(user)
                            
                            Button(action: {
                                    addNoteShowing.toggle() }, label: {Text("Add Note")})
                                .sheet(isPresented: $addNoteShowing, content: {
                                    addNote()
                                })
                            
                            Spacer()
                        }
                    }

                    if (self.index == 2) {
                        Dashboard()
                    } //Dashboard Tab
                    
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
