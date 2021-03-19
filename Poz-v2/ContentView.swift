import SwiftUI
import LocalAuthentication

class User : ObservableObject {
    @Published var name = "" // UserDefaults.standard.string(forKey: "Tap") ?? "";
}

class BookOpen : ObservableObject {
    @Published var isOpen = false // UserDefaults.standard.string(forKey: "Tap") ?? "";
}


struct ContentView: View {
    
    //vars to control which screen/tab is showing
    @State var index = 0
    
    
    // to decide which login views to show
    @State private var newUser = false // UserDefaults.standard.bool(forKey: "Tap"); // face id switch
    @State private var isWelcomeScreensShowing = false // onboard screen switch
    @State private var isEnterNameScreenShowing = false // enter name screen switch

    @State public var isUnlocked = false
    
    
    @State var isBookOpen: Bool = true;
    let bookOpen = BookOpen()

    //username
    let user = User()
    
    //  for paging to new  note page
    @State var indexH: Int = 1
    
    @Environment(\.colorScheme) var colorScheme
    
    //for  side menu
    @State var dark = false
    @State var show = false
    @State private var notesListShowing: Bool = false;
    
    let colorString = "red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)"
    
    var body: some View {
        
        VStack {
            if (self.isUnlocked) {
                
                VStack {
                    
                    //top navigation
                    HStack (spacing: 100){
                        // notes list button
                        Button (action: { notesListShowing.toggle() }){
                            Image(systemName: "clock.arrow.circlepath")
                                .resizable().frame(width: 27, height: 25)
                                .foregroundColor(isBookOpen == true ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)))
                        }
                        .sheet(isPresented: $notesListShowing, content: { NotesList() })
                        
                        //open close journal button
                        Button (action: { isBookOpen.toggle() }){
                            Image(systemName: (isBookOpen == true ? "book.circle.fill" : "book.circle"))
                                .resizable().frame(width: 30, height: 30)
                                .foregroundColor(isBookOpen == true ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)))
                        }
                        
//                        stats
                        Button (action: {
                            if (index == 0) {
                                index = 2
                            } else if (index == 2) {
                                index = 0
                            }
                        }){
                            Image(systemName: "number.circle")
                                .resizable().frame(width: 30, height: 30)
                                .foregroundColor(isBookOpen == true ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)))
                        }
                    }
                    .padding(.top, 50)
                    .padding(.bottom, -3)

                    // if book is open, show notebook
                    if (isBookOpen) {
                        
                        if (bookOpen.isOpen == false) {
                            
                            Notebook(indexAdd: self.indexH).environmentObject(bookOpen)
                            
                        } else { }
                        
//                    } else if (self.index == 2) {
                    } else if (!isBookOpen) {
                        
                        
                        // home screen
                        if (self.index == 0) {
                            VStack {
                            ScrollView(.vertical) {
                                
                                VStack  { // (alignment: .leading)
                                    Text("Good morning,")
                                        .font(Font.custom("Poppins-Regular", size: 24))
                                        .foregroundColor(Color.primary)
                                        .padding(.top, 20)
                                    Text("Kish")
                                        .font(Font.custom("Poppins-Bold", size: 42))
                                        .foregroundColor(Color.primary)
                                

//                                    VStack {
                                        Image("notebook").resizable().frame(width: 350, height: 380)
//                                            .offset(x: -70)
                                        Button(action: { isBookOpen.toggle() }) {
                                            Text("Open Journal")
                                                .font(Font.custom("Poppins-Regular", size: 20))
                                                .foregroundColor(Color.primary)
                                                .frame(width: 200, height: 50)
                                                .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                                                .cornerRadius(50)
//                                                .padding(.horizontal, 20)
    //                                            .padding(.bottom, 60)
                                        }
//                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 40)
                                .offset(x: 0, y: -40)
                                
//                                userNameOutput().environmentObject(user)
//                                    .padding(.top, 40)
//                                    .padding(.bottom, 30)
//
//                                QuoteBlock()
//                                    .padding(.bottom, 30)
//
////                                JournalTypes(x: self.x)
////                                    .padding(.bottom, 30)

//                                BreatheScroller()
                                Spacer()

                            }
                        }
                            
                        //dashboard screen
                        } else if (self.index == 2) {
                            Dashboard()
                        }
                    }
                    
                    
                }
                .background(isBookOpen == true ? Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .ignoresSafeArea(edges: .all)
//                .ignoresSafeArea(edges: .bottom)
//                bottomTabs(index: self.$index)
                
                
                // onboarding login
            } else {
                if (isWelcomeScreensShowing == true) {
                    Onboarding()
                    Button(action: { isWelcomeScreensShowing = false }) {
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
                            Button(action: {
                                isEnterNameScreenShowing = false
                                isUnlocked = true
                                if (user.name == "") {
                                    user.name = "You"
                                }
                                
                                newUser = false
                                UserDefaults.standard.set(user.name, forKey: "Tap")
                                UserDefaults.standard.set(newUser, forKey: "Tap")
                            }) {
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
                                isUnlocked = true
                                user.name = "You"
                                
                            }, label: {Text("Skip")})
                            .offset(x: 150, y: -30)
                        }
                }
            } // when not authenticated
        }
        .onAppear(perform: checkNewUser)
        
    }
    
    //checks if its user first time loggin in
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
    
    // face id
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
