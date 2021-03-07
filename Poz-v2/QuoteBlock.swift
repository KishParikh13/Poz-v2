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
            Text("-Alert Einstein")
                .font(Font.custom("Poppins-Regular", size: 20))
        }
        .multilineTextAlignment(.center)
        .frame(width: 300, height: 200)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .padding(.horizontal, 40)
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
        .cornerRadius(10.0)
    }
}

struct QuoteBlock_Previews: PreviewProvider {
    static var previews: some View {
        QuoteBlock()
    }
}
