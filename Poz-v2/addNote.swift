import SwiftUI

struct addNote: View {
    
//    sortDescriptor = NSSortDescriptor(key: "createdAt", ascending "true)
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State private var message: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var successMessage: Bool = false
    
    var body: some View {
        
        Capsule()
            .frame(width: 100, height: 8)
            .padding(.top, 10)
            .foregroundColor(.gray)
        
        Text((message == "" ? "Tap anywhere to begin typing" : "Click Submit to Save"))
            .padding(.top, 30)
            .foregroundColor(.gray)
        
        TextEditor(text: self.$message)
            // make the color of the placeholder gray
            .padding(.top, 40)
            .padding(.horizontal, 40)
        
        Button("Submit") {
                
            let dates = ["2/1/2021", "2/5/2021", "2/7/2021"]
            let chosenDate = dates.randomElement()!
            
            let emojis = ["😙", "😋", "🤪"]
            let chosenEmoji = emojis.randomElement()!
            
            let note = Note(context: self.moc)
            note.id = UUID()
            note.note = "\(message)"
            note.date = "\(chosenDate)" // init()
            note.emoji = "\(chosenEmoji)"
            note.stringLength = Double(message.count)
            
            try? self.moc.save()
            
            message = ""

            presentationMode.wrappedValue.dismiss()
            
            self.successMessage.toggle()
        }
        .disabled(message == "")
        .foregroundColor(message == "" ? .gray : .black)
        .font(Font.custom("Poppins-Regular", size: 20))
        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        .frame(width: 200, height: 50)
        .background(message == "" ? Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) : Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
        .cornerRadius(50)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
        
        
    }
}
