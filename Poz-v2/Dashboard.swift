//
//  Stats.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/2/21.
//

import SwiftUI

struct Dashboard: View {
    
    @State var index = 1
    @State var offset : CGFloat = 0
    
    var body: some View {
        VStack {
            appTopBar(index: self.$index, offset: self.$offset)
            
            if (index == 0) {
                Spacer()
            } else if (index == 1) {
                NotesList()
            }
       }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
