import SwiftUI

struct appTopBar : View {
    
    @Binding var index : Int
    @Binding var offset : CGFloat
    
    var body : some View {
        
        HStack (spacing: 16){
            Button(action: {self.index = 0}) {
                VStack (spacing: 8) {
                    HStack (spacing: 8){
//                        Image("poz").resizable()
//                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .opacity(self.index == 0 ? 1 : 0.3)
                        Text("Entries")
                            .font(Font.custom("Poppins", size: 16))
                            .foregroundColor(Color.black)
                            .opacity(self.index == 0 ? 1 : 0.3)
                    }
                    Capsule()
                        .fill(Color.black)
                        .opacity(self.index == 0 ? 1 : 0)
                        .frame(height: 4, alignment: .center)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                }
            }
            Button(action: {self.index = 1}) {
                VStack (spacing: 8) {
                    HStack (spacing: 8){
//                        Image("statsIcon").resizable()
//                            .frame(width: 40, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .opacity(self.index == 1 ? 1 : 0.3)
                        Text("Stats")
                            .font(Font.custom("Poppins", size: 16))
                            .foregroundColor(Color.black)
                            .opacity(self.index == 1 ? 1 : 0.3)
                    }
                    Capsule()
                        .fill(Color.black)
                        .opacity(self.index == 1 ? 1 : 0)
                        .frame(height: 4, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                }
            }
        }
        .padding(.top, 60)
        .padding(.horizontal)
        .padding(.bottom, 0)
        .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
    }
}
