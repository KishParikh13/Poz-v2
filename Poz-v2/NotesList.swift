import SwiftUI

struct NotesList: View {
    
    //get data from core data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.createdAt, ascending: false)]) var notes: FetchedResults<Note>
    
    @State public var addNoteShowing = false

    
    //filtering
    @State var text = ""
    
    var body: some View {
        
        //list of all notes
        VStack {
            
            Capsule()
                .frame(width: 100, height: 8)
                .padding(.top, 10)
                .foregroundColor(.gray)
                .padding(.bottom, 15)
        
            VStack {
                ZStack (alignment: .topLeading) {
                    
                    SearchView(searchText: $text)
                    
                    if text.isEmpty {
                        Text("Search previous entries")
                            .foregroundColor(.gray)
                            .padding(.top, 18)
                            .padding(.leading, 38)
                    }
                }
                .padding(.top, -10)
                .padding(.horizontal, 20)
            }
            
            
            
            List {
                ForEach (notes.filter{ text == "" ? true : $0.note!.localizedCaseInsensitiveContains(text)}, id: \.id) { notes in
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
//                .onDelete(perform: removeItem)
            }
            .padding(.top, -8)
            .padding(.bottom, -8)

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
