//
//  Journal.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/13/21.
//

import SwiftUI

struct JournalPicker: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Image("notebook").resizable().frame(width: 500, height: 550)
            Text("Kish")
                .offset(y: -100)
                .foregroundColor(.white)
                .font(Font.custom("Blueberry", size: 40))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+50)
        .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
    }
}

struct JournalPicker_Previews: PreviewProvider {
    static var previews: some View {
        JournalPicker()
    }
}
