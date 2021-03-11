import SwiftUI
import Pages

struct Car {
    var model: String
}

struct Notebook: View {
    let cars:[Int] = [1, 2, 3, 4, 5]
    @State var index: Int = 0
    @State var indexH: Int
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.createdAt, ascending: true)]) var notes: FetchedResults<Note>
    
    @Environment(\.colorScheme) var colorScheme
    @State public var addNoteShowing = false
    
    @State var numberOfEntries = 0
    
    var body: some View {
        Pages(
            currentPage: $indexH,
            transitionStyle: .pageCurl
        ) {
            ZStack {
                ModelPages(
                    notes, currentPage: $index,
                    transitionStyle: .pageCurl,
                    bounce: true
                )
                { pageIndex, notes  in
                    
                    VStack (alignment: .leading) {
//                        Buttons(
                        
                        
                        ScrollView (.vertical, showsIndicators: false) {
                            Text(notes.date ?? "?/?/????")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.top, 50)
                            
                            Text(notes.emoji ?? "")
                                .font(.system(size: 48))
                            Text(notes.note ?? "Could not load note")
                                .font(.system(size: 20))
                            }
                    }
                    .padding()
                    .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9884551167, green: 1, blue: 0.9494463801, alpha: 1)))
                    .ignoresSafeArea(edges: .all)
                }
                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9884551167, green: 1, blue: 0.9494463801, alpha: 1)))
                .ignoresSafeArea(edges: .all)

                //addnote button
                Button(action: {
                    addNoteShowing.toggle()
                    indexH = 1
                }) {
                    ZStack{
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                        Image(systemName: "plus")
                        .foregroundColor(.black)
                    }
                }
                .offset(x: 0, y: (UIScreen.main.bounds.height/2 - 150))
        //        .sheet(isPresented: $addNoteShowing, content: { addNote() })
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




//                Image(systemName: "book.closed").resizable().frame(width: 20, height: 20)
//                Image(systemName: "mic")

//                Image(systemName: "star")

//                Image(systemName: "video")
//                Image(systemName: "camera")

//                Image(systemName: "plus")
