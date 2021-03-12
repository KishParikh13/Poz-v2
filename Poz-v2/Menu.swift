//
//  Menu.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/12/21.
//

import SwiftUI

struct Menu: View {
    
    @Binding var dark: Bool
    @Binding var show: Bool
    
    var body: some View {
        HStack {
            VStack {
            HStack {
                
                //addnote button
                Button(action: {
                    
                    withAnimation (.default) {
                        self.show.toggle()
                    }
                }) {
                    ZStack{
//                        Circle()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                        Image(systemName: "chevron.backward")
                        .foregroundColor(.primary)
                    }
                }
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                Button(action: {
//                    indexH = 1
                }) {
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                        Image(systemName: "pencil")
                        .foregroundColor(.black)
                    }
                }
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 68)
            
            HStack {
                Image(systemName: "moon.fill")
                    .font(.title)
                Text("Dark Mode")
                Spacer()
                
                Button( action: {
                    
                    self.dark.toggle()
                    
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light

                }) {
                    Image(systemName: (self.dark ? "moon.circle" : "moon.circle.fill"))
                        .font(.title)
                }
            }
            
            Spacer()
            
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
            .frame(width: UIScreen.main.bounds.width/1.5)
        .background(self.dark ? Color.black : Color.yellow).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .overlay(Rectangle().stroke(Color.primary.opacity(0.4), lineWidth: 2).shadow(radius: 1).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
//        Button(action: {self.show.toggle()} ) {
//
//            Spacer()
//        }
//        .background(Color.black)
//        .frame(width: UIScreen.main.bounds.width / 0.5)
    }
}

//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}
