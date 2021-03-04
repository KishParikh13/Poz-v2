import SwiftUI

struct NotesList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) var notes: FetchedResults<Note>
    
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
                            Text(notes.note ?? "Name")
                                .font(.system(size: 20))
                        }
                    }
                }
                .onDelete(perform: removeItem)
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

struct NotesList_Previews: PreviewProvider {
    static var previews: some View {
        NotesList()
    }
}
