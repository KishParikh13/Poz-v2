import SwiftUI
import LocalAuthentication

class User : ObservableObject {
    @Published var name = ""
}


struct ContentView: View {
    
    //vars to control which screen/tab is showing
    @State var index = 0
    
    
    // to decide which login views to show
    @State private var newUser = false; // face id switch
    @State private var isWelcomeScreensShowing = false // onboard screen switch
    @State private var isEnterNameScreenShowing = false // enter name screen switch
    
//    @State public var x = 1
    
    @State public var isUnlocked = true
    
    //username
    let user = User()
    
    //  for paging to new  note page
    @State var indexH: Int = 1
    
    
    //for  side menu
    @State var dark = false
    @State var show = false
    
    var body: some View {
        
        VStack {
            if self.isUnlocked {
                VStack {
                    if (self.index == 0) {
                
                        Notebook(indexAdd: self.indexH)
                        
                    } else if (self.index == 2) {
//                        Dashboard()
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
                            .foregroundColor(Color.primary)
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
                                    .foregroundColor(Color.primary)
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



// side menu
//                        ZStack (alignment: .leading) {
//
//                            GeometryReader {_  in
//
////                                Notebook(indexAdd: self.indexH)
//
//                                //button to call side menu
//                                Button(action: {
//
//                                    withAnimation(.default) {
//                                        self.show.toggle()
//                                    }
//
//                                }) {
//                                    ZStack{
//                                        Circle()
//                                            .frame(width: 40, height: 40)
//                                            .foregroundColor(self.dark ?  Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9884551167, green: 1, blue: 0.9494463801, alpha: 1)))
//                                        Image(systemName: "line.horizontal.3").resizable()
//                                            .frame(width: 15, height: 12)
//                                            .foregroundColor(Color.primary)
//                                    }
//                                }
//                                .offset(x: 14, y: 20)
//
//                            }
//
//                            //side menu
//                            HStack {
//                                Menu(dark: self.$dark, show: self.$show)
//                                    .preferredColorScheme(self.dark ? .dark : .light)
//                                    .offset(x: self.show ? 0 : -UIScreen.main.bounds.width)
//
//
//                                Spacer(minLength: 0)
//                            }
//                            .background(Color.primary.opacity(self.show ? (self.dark ?  0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
//                        }
//                        .padding(.top, -8)
//                        .padding(.bottom, -8)
//                        
