import SwiftUI
import Pages

struct Car {
    var model: String
}

struct Notebook: View {

    // for previus entry  pages
    @State var index: Int = 0
    @State var numberOfEntries = 0
    
    // for high level old entries and new entry page setup
    @State var indexAdd: Int
    
    // core data
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.createdAt, ascending: true)]) var notes: FetchedResults<Note>
    
    // night mode checker
    @Environment(\.colorScheme) var colorScheme
    @State private var notesListShowing: Bool = false;
    
    var body: some View {
        
        Pages( // highest level page system to old old entry pages and add entry
            currentPage: $indexAdd,
            transitionStyle: .pageCurl
        ) {
            ZStack {
                ModelPages( // holds  all previously added notes from core data
                    notes, currentPage: $index,
                    transitionStyle: .pageCurl,
                    bounce: true
                )
                { pageIndex, notes  in
                    
                    // note page
                    VStack (alignment: .leading) {
                        
                        
                        
                        ScrollView (.vertical, showsIndicators: false) {
                            
                            HStack {
                                Button (action: {notesListShowing.toggle()}) {
                                    Image(systemName: "list.bullet")
                                }
                                .sheet(isPresented: $notesListShowing, content: { NotesList() })
                                
                                Spacer()
                                
                                Text(notes.date ?? "?/?/????")
                                    .font(.system(size: 16, weight: .bold))
                                
                                Spacer()
                                
                                Button (action: {notesListShowing.toggle()}) {
                                    Image(systemName: "square.and.pencil")
                                }
                                .sheet(isPresented: $notesListShowing, content: { NotesList() })
                            }
                            .padding(.top, 50)
                            
                            Text(notes.emoji ?? "")
                                .font(.system(size: 48))
                            Text(notes.note ?? "Could not load note")
                                .font(.system(size: 20))
                        }
                        .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9884551167, green: 1, blue: 0.9494463801, alpha: 1)))
                    .ignoresSafeArea(edges: .all)
                }
                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9884551167, green: 1, blue: 0.9494463801, alpha: 1)))
                .ignoresSafeArea(edges: .all)
                
                //addnote button
                Button(action: {
                    indexAdd = 1
                }) {
                    ZStack{
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                        Image(systemName: "plus")
                        .foregroundColor(.black)
                    }
                }
                .offset(x: (UIScreen.main.bounds.width/2 - 50), y: (UIScreen.main.bounds.height/2 - 100))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            
            
            addNote()
        }
        .onAppear {
           DispatchQueue.main.async {
              self.index = notes.count - 1
           }
        }
        .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9884551167, green: 1, blue: 0.9494463801, alpha: 1)))
        .ignoresSafeArea(edges: .all)
    }

    
}
//
//struct Notebook_Previews: PreviewProvider {
//    static var previews: some View {
//        Notebook()
//    }
//}


struct Buttons: View {
    var body: some View {
        HStack (spacing: 20) {
            Image(systemName: "square.and.pencil").resizable().frame(width: 18, height: 18)
            Image(systemName: "trash")
            Image(systemName: "list.bullet").resizable().frame(width: 20, height: 15)
        }
        .padding(.top, 60)
        .padding(.horizontal, 60)
    }
}
//
//struct AddNoteButton: View {
//   //addnote button
//Button(action: {
//    addNoteShowing.toggle()
//    indexH = 1
//}) {
//    ZStack{
//        Circle()
//            .frame(width: 60, height: 60)
//            .foregroundColor(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
//        Image(systemName: "plus")
//        .foregroundColor(.black)
//    }
//}
//.offset(x: 0, y: (UIScreen.main.bounds.height/2 - 150))
////        .sheet(isPresented: $addNoteShowing, content: { addNote() })
//.shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//    var body: some View {
//
//    }
//}
