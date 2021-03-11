import SwiftUI
import LocalAuthentication

class User : ObservableObject {
    @Published var name = ""
}


struct ContentView: View {
    
    //vars to control which screen/tab is showing
    @State var index = 0
    
    
    @State private var newUser = false;
    
    @State private var isWelcomeScreensShowing = false // onboard screen switch
    @State private var isEnterNameScreenShowing = false // enter name screen switch

    @State public var addNoteShowing = false
    
    @State public var x = 1
    
    @State public var isUnlocked = true
    
    let user = User()
    
    
    
    var body: some View {
        
        
//
//    var body: some View {
//        VStack {
//            if (isWelcomeScreensShowing == true) {
//                    Onboarding()
//                    Button(action: {isWelcomeScreensShowing = false}) {
//                        Text("Get Started")
//                            .font(Font.custom("Poppins-Regular", size: 20))
//                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
//                            .frame(width: 200, height: 50)
//                            .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
//                            .cornerRadius(50)
//                            .padding(.horizontal, 20)
//                            .padding(.bottom, 60)
//                    }
//
//            } else { //Onoarding Screen
//
//                if (isEnterNameScreenShowing == true) {
//                    EnterName().environmentObject(user)
//                        .padding(.top, 20)
//
//                    ZStack {
//                        Button(action: {
//                            isEnterNameScreenShowing = false
//                        }) {
//                                Text("Next")
//                                    .font(Font.custom("Poppins-Regular", size: 20))
//                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
//                                    .frame(width: 200, height: 50)
//                                    .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
//                                    .cornerRadius(50)
//                                    .padding(.horizontal, 20)
//                                    .padding(.bottom, 60)
//                        }
//                        Button (action: {isEnterNameScreenShowing = false}, label: {Text("Skip")})
//                            .offset(x: 150, y: -30)
//
//                    }
//
//                } else { // Enter name screen
//
//                    if (self.index == 0) {
//
//
//                        VStack {
//                            ScrollView(.vertical) {
//                                userNameOutput().environmentObject(user)
//                                    .padding(.bottom, 30)
//
//                                QuoteBlock()
//                                    .padding(.bottom, 30)
//
//                                JournalTypes(x: self.x)
//                                    .padding(.bottom, 30)
//
//                                BreatheScroller()
//
//                            }
//                        }
//                        .padding(.top, -8)
//                        .padding(.bottom, -8)
//                    }
//
//                    if (self.index == 2) {
//                        Dashboard()
//                    } //Dashboard Tab
//
//
//
//        }
//    }
//
//}
//
//    }
//
//
        
        VStack {
            if self.isUnlocked {
                VStack {
                    if (self.index == 0) {
                
                    
                        VStack {
//                            ScrollView(.vertical) {
//                                userNameOutput().environmentObject(user)
//                                    .padding(.bottom, 30)
//
//                                QuoteBlock()
//                                    .padding(.bottom, 30)
//
//                                JournalTypes(x: self.x)
//                                    .padding(.bottom, 30)
//
//                                BreatheScroller()
//
//                            }
                            
                            Notebook()
                    
                        }
                        .padding(.top, -8)
                        .padding(.bottom, -8)

                    } else if (self.index == 2) {
                        Dashboard()
                    }
                    
//                    bottomTabs(index: self.$index)
                    
                }
                .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                
                
                
            } else {
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
                } else if (isEnterNameScreenShowing == true) {
                        EnterName().environmentObject(user)
                            .padding(.top, 20)

                        ZStack {
                            Button(action: { isEnterNameScreenShowing = false }) {
                                Text("Next")
                                    .font(Font.custom("Poppins-Regular", size: 20))
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                    .frame(width: 200, height: 50)
                                    .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                                    .cornerRadius(50)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 60)
                            }
                            Button (action: {
                                        isEnterNameScreenShowing = false
                                        isUnlocked = true},
                                    label: {Text("Skip")})
                                .offset(x: 150, y: -30)

                        }
                }
            } // when not authenticated
        }
        .onAppear(perform: checkNewUser)
    }
    
    func checkNewUser() { //checks if theres new user, either authenticates or onboards
        if (newUser == true) {
            isWelcomeScreensShowing = true
            isEnterNameScreenShowing = true;
                
        } else {
            isWelcomeScreensShowing = false
            isEnterNameScreenShowing = false
            authenticate()
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        authenticate()
                    }
                }
                
            }
        } else {
            // no biometrics
        }
    } //faceID function
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isUnlocked: false)
    }
}
