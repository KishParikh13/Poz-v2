//
//  QuoteBlock.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/6/21.
//

import SwiftUI

struct QuoteBlock: View {
    
    var body: some View {
        VStack {
            Text("'Life is like riding a bicycle. To keep your balance you must keep moving.'")
                .font(Font.custom("Poppins-Regular", size: 24))
                .padding(.bottom, 10)
            Text("-Albert Einstein")
                .font(Font.custom("Poppins-Regular", size: 20))
        }
        .multilineTextAlignment(.center)
        .frame(width: 290, height: 200)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .padding(.horizontal, 40)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))]), startPoint: .bottomTrailing, endPoint: .topLeading))
        .cornerRadius(10.0)
    }
}

struct QuoteBlock_Previews: PreviewProvider {
    static var previews: some View {
        QuoteBlock()
    }
}
