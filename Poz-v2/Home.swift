import SwiftUI


//home screen not being used atm

struct Home: View {
//    @State public var isBookOpen: Bool
    
    var body: some View {
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
                        Button(action: { }) { // isBookOpen.toggle() 
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
    }
}
