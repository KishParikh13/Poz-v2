import SwiftUI

struct NotesList: View {
    
    //get data from core data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.createdAt, ascending: false)]) var notes: FetchedResults<Note>
    
    @State public var addNoteShowing = false
    
    var body: some View {
        
        //list of all notes
        ZStack {
            List {
                ForEach (notes, id: \.id) { notes in
                    HStack (alignment: .top) {
                        Text(notes.emoji ?? "😶")
                            .font(.system(size: 48))
                        VStack (alignment: .leading) {
                            Text(notes.date ?? "1/1/2021")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, -3)
                            Text(notes.note ?? "Name")
                                .font(.system(size: 20))
                        }
                    }
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                }
                .onDelete(perform: removeItem) //delete command
            }
            .padding(.top, -8)
            .padding(.bottom, -8)
            
            
            //addnote button
            Button(action: { addNoteShowing.toggle() }) {
                ZStack{
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                    Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                }
            }
            .offset(x: (UIScreen.main.bounds.width/2 - 50), y: (UIScreen.main.bounds.height/2 - 150))
            .sheet(isPresented: $addNoteShowing, content: { addNote() })
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1490374432)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        }
    }
    
    //delete function
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
