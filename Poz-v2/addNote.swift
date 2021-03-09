import SwiftUI

struct addNote: View {
    
    //get data from CoreData
    @Environment(\.managedObjectContext) var moc
    
    //vars
    @State private var message: String = ""
    @State private var emoji: String = ""
    
    @Environment(\.presentationMode) var presentationMode //check if pop up active
    
    @State var selected = ""
    @State private var selectedIndex: Int = 0
    
    //content
    var body: some View {
        
        Capsule()
            .frame(width: 100, height: 8)
            .padding(.top, 10)
            .foregroundColor(.gray)
        
        Text((message == "" ? "Type your thoughts" : "Click Submit to Save"))
            .padding(.top, 30)
            .foregroundColor(.gray)
        
        //text input
        ZStack {
            TextEditor(text: self.$message)
            Text("Text").opacity(0).padding(.all, 8)
        }
        .padding(.top, 20)
        .padding(.horizontal, 40)
        
        //emoji picker
//        Text("Scroll below to add emoji" + "\(selected)")
//            .padding(.top, 30)
//            .foregroundColor(.gray)
        
        EmojiPicker(selectedIndex: $selectedIndex, selected: self.$selected)
        
        //submit button
        Button("Submit") {
            
            // create note item
            let note = Note(context: self.moc)
            
            // get current data and format it
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M/d/yy h:mm a"
            let dateString = dateFormatter.string(from: date as Date)
            
            //assign vars on click
            note.id = UUID() //create id
            note.note = "\(message)" //input message
            note.createdAt = date //actual date to sort
            note.date = "\(dateString)" //formatted date to sort
            note.emoji = "\(selected)" // emoji
            note.stringLength = Double(message.count) // length of entry
            
            
            try? self.moc.save() //save inputted values
            
            message = "" //reset input

            presentationMode.wrappedValue.dismiss() //dismiss popup on click

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
