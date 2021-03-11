import SwiftUI
import Pages

struct Car {
    var model: String
}

struct Notebook: View {
    let cars = [Car(model: "Ford"), Car(model: "Ferrari")]
    @State var index: Int = 0
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Note.createdAt, ascending: true)]) var notes: FetchedResults<Note>
    
    @Environment(\.colorScheme) var colorScheme
    @State public var addNoteShowing = false
    
    var body: some View {
        ZStack {
        ModelPages(
            notes, currentPage: $index,
            transitionStyle: .pageCurl,
            bounce: true
        )
        { pageIndex, notes  in
            VStack {
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
                    Spacer()
                }
                .padding()
                .padding(.top, 50)
                
                Spacer()
            }
            .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .ignoresSafeArea(edges: .all)
        }
        .background(Color(UIColor.systemBackground))
        .ignoresSafeArea(edges: .all)
        
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
        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09803921569)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct Notebook_Previews: PreviewProvider {
    static var previews: some View {
        Notebook()
    }
}
