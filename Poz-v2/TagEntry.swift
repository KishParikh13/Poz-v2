//
//  TagEntry.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/15/21.
//

import SwiftUI

struct TagEntry: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    
    @State public var selectedColor: String

    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            Text("You selected: \(selectedColor)")
        }
    }
}
//
//struct TagEntry_Previews: PreviewProvider {
//    static var previews: some View {
//        TagEntry()
//    }
//}
