import SwiftUI
import Pages

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
    
    
    @State private var editing: Bool = false;
    
    @State private var temptext = "";
    
    @EnvironmentObject var bookOpen: BookOpen
    
    
    @State var image: Data = .init(count: 0)
    @State var show = false
    
//    @State private var lastNameFilter = "A"
    
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
                        
                        
                        //top bar
                        VStack {
                        
                            HStack {
                                Text(notes.date ?? "1/1/1")
                                    .font(Font.custom("Poppins-Bold", size: 16))
                                    .foregroundColor(Color.primary)

                                Spacer()

                                // emoji putput
                                Text(notes.emoji ?? "X")
                                    .font(.system(size: 16))
                                    .padding(.horizontal, 0)
                                
                                // tag
                                HStack {
                                    Text(notes.entryTag ?? "")
//                                        .padding(.horizontal, 7)
//                                        .padding(.top, 4)
//                                        .padding(.bottom, 4)
//                                        .background(selectedTag.color)
                                }
                                .foregroundColor(Color.primary)
                                .cornerRadius(5)

                            
                            
                            
                         
                        }
                            
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 1)
                            .foregroundColor(Color.primary)
                        
                    }
                    .padding(.top, 16)
//                        .padding(.top, 16)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 3)

                    ScrollView (.vertical, showsIndicators: false) {

                            if (editing) {
                                
                                // if editing is on
                                VStack {
                                    Text(notes.emoji ?? "")
                                        .font(.system(size: 48))
                                        .padding(.top, 8)
                                        .padding(.leading, 5)
                                        .padding(.bottom, -10)
                                    
                                    TextEditor(text: $temptext)
                                        .background(Color.clear)
                                        .font(.system(size: 20))
                                        .padding(.top, 8)
    //                                    .frame(height: 200)
                                    
                                    //submit button
                                    Button(action: {
                                        notes.note = temptext
                                        editing.toggle()
                                    }) {
                                        ZStack{
                                            Text("Save")
                                        }
                                        .foregroundColor(.black)
                                        .font(Font.custom("Poppins-Regular", size: 20))
                                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                        .frame(width: 200, height: 50)
                                        .background(Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
                                        .cornerRadius(50)
                                        .padding(.horizontal, 20)
                                        .padding(.bottom, 60)
                                    }
                                }
                                .padding(.top, -16)
                                .padding(.leading, -5)
                            } else {
                                
                                VStack (alignment: .leading) {
                                    Text(notes.note ?? "Could not load note")
                                        .font(Font.custom("Poppins-Regular", size: 16))
                                }
                                .padding(.top, 8)
                                
                                if (self.image.count != 0) {
                                    Image(uiImage: UIImage(data: self.image)!)
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(6)
                                        .padding()
                                }
                            }
                            
                        }
                        .padding(.top, -11)
                        .padding(.horizontal, 20)
                    }
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9882352941, green: 1, blue: 0.9490196078, alpha: 1)))
                    .ignoresSafeArea(edges: .all)
                }
                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) : Color(#colorLiteral(red: 0.9882352941, green: 1, blue: 0.9490196078, alpha: 1)))
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
            
            
            addNote().environmentObject(bookOpen) //.environment(\.managedObjectContext, self.moc)

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
