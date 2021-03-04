import SwiftUI

struct NotesList: View {
    
    //get data from core data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)]) var notes: FetchedResults<Note>
    
    var body: some View {
        
        //list of all notes
        VStack {
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
