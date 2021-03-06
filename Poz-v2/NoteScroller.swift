import SwiftUI

struct JournalTypes: View {
    let types: [Journal] = [
        Journal(name: "Note", emoji: "😳", color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)), x: 0),
        Journal(name: "Gratitude", emoji: "🥴", color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), x: 1),
        Journal(name: "To Do", emoji: "😧", color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)), x: 2),
        Journal(name: "Reminder", emoji: "😭", color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), x: 3),
        Journal(name: "Memory", emoji: "🤬", color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), x: 4)]
    
    @State public var addNoteShowing = false
    @State public var x: Int
    
    var body: some View {
        VStack {
            Text ("Journal")
                .font(Font.custom("Poppins-Regular", size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 0)
                .padding(.leading, 16)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 16) {
                    ForEach(types,id: \.self) {Journal in
                        Button(action: { addNoteShowing.toggle() }, label: {
                            VStack {
                                Text(Journal.name)
                                    .font(Font.custom("Poppins-Regular", size: 24))
                                Text(Journal.emoji)
                                    .font(Font.custom("Poppins-Regular", size: 80))
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                            .padding(.horizontal, 40)
                            .foregroundColor(.white)
                            .background(Journal.color)
                            .cornerRadius(10.0)
                        })
                        .sheet(isPresented: $addNoteShowing, content: { addNote() })
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct JournalTypes_Previews: PreviewProvider {
    static var previews: some View {
        JournalTypes(x: 0)
    }
}

struct Journal: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var emoji: String
    var color: Color
    var x: Int
}
