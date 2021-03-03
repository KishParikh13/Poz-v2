//
//  ContentView.swift
//  ContentView
//
//  Created by Kish Parikh on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State private var username: String = ""
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            List {
                ForEach (notes, id: \.id) { notes in
                    HStack (alignment: .top) {
                        Text(notes.emoji ?? "😶")
                            .font(.system(size: 48))
                        VStack (alignment: .leading) {
                            Text(notes.date ?? "1/1/2021")
                                .font(.system(size: 16, weight: .bold))
                            Text(notes.name ?? "Name")
                                .font(.system(size: 20))
                        }
                    }
                }
                .onDelete(perform: removeItem)
            }
            
            TextField( "Tap anywhere to begin typing", text: $username) { isEditing in
                self.isEditing = isEditing
            } onCommit: {
              //  validate(name: username)
            }
            .frame(width: 300, height: 100)
            .autocapitalization(.none)
            .disableAutocorrection(true)

            
            Button("Add") {
//                let firstNames = ["A", "B", "C"]
//                let chosenName = firstNames.randomElement()!
                
                let dates = ["2/1/2021", "2/5/2021", "2/7/2021"]
                let chosenDate = dates.randomElement()!
                
                let emojis = ["😙", "😋", "🤪"]
                let chosenEmoji = emojis.randomElement()!
                
                let note = Note(context: self.moc)
                note.id = UUID()
                note.name = "\(username)"
                note.date = "\(chosenDate)"
                note.emoji = "\(chosenEmoji)"
                
                try? self.moc.save()
            }
            
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            moc.delete(note)
        }
        
        do {
            try self.moc.save()
        } catch {
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
