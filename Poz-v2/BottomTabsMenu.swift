import SwiftUI

struct bottomTabs: View {
    
    @Binding var index: Int
    
    var body: some View {
        VStack {

            ZStack {
                HStack {
                    Button(action: {self.index = 0}) {
                        VStack {
                            Image("homeIcon").resizable()
                                .frame(width: 50, height: 50)
                        }
                        .opacity((self.index == 0 ? 1 : 0.3))
                        .padding(.leading, 60)
                        .padding(.bottom, 10)
                    }

                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)

                    Button(action: {self.index = 2}) {
                        VStack {
                            Image("statsIcon").resizable()
                                .frame(width: 50, height: 50)
                        }
                        .opacity((self.index == 2 ? 1 : 0.3))
                        .padding(.trailing, 60)
                        .padding(.bottom, 10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
                .background(Color(#colorLiteral(red: 0.9552872777, green: 0.9552872777, blue: 0.9552872777, alpha: 1)))
            }
        }
    }
    
}
