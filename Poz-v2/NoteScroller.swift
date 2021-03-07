import SwiftUI

struct JournalTypes: View {
    let types: [Journal] = [
        Journal(name: "Note", emoji: "😳", color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), x: 0),
        Journal(name: "Gratitude", emoji: "🥴", color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), x: 1),
        Journal(name: "To Do", emoji: "😧", color: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)), x: 2),
        Journal(name: "Reminder", emoji: "😭", color: Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)), x: 3),
        Journal(name: "Memory", emoji: "🤬", color: Color(#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1)), x: 4)]
    
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
