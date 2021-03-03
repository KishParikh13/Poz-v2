import SwiftUI

struct addNote: View {
    
//    sortDescriptor = NSSortDescriptor(key: "createdAt", ascending "true)
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State private var message: String = ""
    
    var body: some View {
        
        TextEditor(text: self.$message)
            // make the color of the placeholder gray
            .padding(.top, 100)
            
        
        Button(message == "" ? "Tap anywhere above to begin typing" : "Submit") {
            
            let dates = ["2/1/2021", "2/5/2021", "2/7/2021"]
            let chosenDate = dates.randomElement()!
            
            let emojis = ["😙", "😋", "🤪"]
            let chosenEmoji = emojis.randomElement()!
            
            let note = Note(context: self.moc)
            note.id = UUID()
            note.note = "\(message)"
            note.date = "\(chosenDate)" // init()
            note.emoji = "\(chosenEmoji)"
            
            try? self.moc.save()
            
            message = ""
        }
        .foregroundColor(self.message == "" ? .gray : .blue)
    }
}
