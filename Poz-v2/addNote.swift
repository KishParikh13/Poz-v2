import SwiftUI
import SwiftSpeech
import PhotoLibraryPicker

struct Tag : Hashable {
    var name : String
    var color : Color
}

struct addNote: View {
    
    var sessionConfiguration: SwiftSpeech.Session.Configuration
    
    public init(sessionConfiguration: SwiftSpeech.Session.Configuration) {
        UITextView.appearance().backgroundColor = .clear
        self.sessionConfiguration = sessionConfiguration
    }
    public init(locale: Locale = .current) { self.init(sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale)) }
    public init(localeIdentifier: String) { self.init(locale: Locale(identifier: localeIdentifier)) }
    
    //get data from CoreData
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode //check if pop up active
    
    @State var selected = ""
    @State private var selectedIndex: Int = 0
    
    
    //audio to text
    @State private var emojiPickerShowing: Bool = false;
    @State private var addPhotoShowing: Bool = false;
    @State private var addSpecialShowing: Bool = false;

    //vars
    @State private var message: String = ""
    @State private var emoji: String = ""
//    @State var image: Data = .init(count: 0)
//    @State var show = false
    
//    @State var pictures = [Picture]()

    @State var date = Date()
    @State var dateFormatter = DateFormatter();
    @State var dateString: String = ""
    
    @State var tagEntrySheetShowing = false;
    @State var selectedTag: Tag = Tag(name: "", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)))
    @State var selectedColor = ""
    
    let tags:[Tag] = [Tag(name: "", color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0))),  Tag(name: "✅ To do", color: Color(#colorLiteral(red: 0.6578102112, green: 0.8591415286, blue: 0.673274219, alpha: 1))), Tag(name: "💭 Idea", color: Color(#colorLiteral(red: 0.8458583951, green: 0.8536861539, blue: 0, alpha: 0.7509899013))), Tag(name: "💢 Rant", color: Color(#colorLiteral(red: 0.9069923162, green: 0.5071092248, blue: 0.4630813003, alpha: 0.4949279179))), Tag(name: "🙏🏻 Gratitude", color: Color(#colorLiteral(red: 0.873713553, green: 0.7492058873, blue: 0.5602819324, alpha: 1))), Tag(name: "📜 Story", color: Color(#colorLiteral(red: 0.6360311508, green: 0.6086863279, blue: 0.8723474145, alpha: 1))), Tag(name: "📝 Note to Self", color: Color(#colorLiteral(red: 0.5947418809, green: 0.8605783582, blue: 0.8334261179, alpha: 1)))]
    
    var body: some View {
        
        //header
        Image(systemName: "house.fill")
            .resizable().frame(width: 30, height: 30)
        
        HStack {
            Text("\(dateString)")
                .font(Font.custom("Poppins-Bold", size: 16))
                .foregroundColor(Color.primary)
            
            Spacer()
            
            //emoji putput
            Text("\(selected)")
                .font(.system(size: 16))
                .padding(.horizontal, 2)
            
            Button (action: {
                tagEntrySheetShowing.toggle()
            }) {
                
                if (selectedTag.name == "") {
                    HStack {
                        Image(systemName: "tag.fill")
                            .resizable().frame(width: 20, height: 20)
                        Text("Tag Entry")
                            .font(Font.custom("Poppins-Regular", size: 16))
                    }
                    .foregroundColor(Color.primary)
                } else {
                    HStack {
                        Text("\(selectedTag.name)")
                            .padding(.horizontal, 7)
                            .padding(.top, 4)
                            .padding(.bottom, 4)
                            .background(selectedTag.color)
                    }
                    .foregroundColor(Color.primary)
                    .cornerRadius(5)
                }
                
            }
            // tag picker
            .sheet(isPresented: $tagEntrySheetShowing) {
                VStack {
                    Picker("Please choose a color", selection: $selectedTag) {
                        ForEach(tags, id: \.self) {
                            Text($0.name)
                                .padding(.horizontal, 7)
                                .padding(.top, 4)
                                .padding(.bottom, 4)
                                .cornerRadius(5)
                                .background($0.color)
                        }
                        .cornerRadius(5)
                        .padding()
                    }
                    Text("You selected: \(selectedTag.name)")
                }
            }
            
        }
        .onAppear() {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            dateString = dateFormatter.string(from: date as Date)
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
        .padding(.bottom, 3)
        
        
        Rectangle()
            .frame(width: UIScreen.main.bounds.width - 40, height: 1)
            .foregroundColor(.black)
            .padding(.bottom, 3)
        
        //text input
        VStack {
            ScrollView {
                
                // text input
                ZStack (alignment: .topLeading) {
                    if message.isEmpty {
                        Text("What's on your mind?")
                            .foregroundColor(.gray)
                            .font(Font.custom("Poppins-Regular", size: 16))
                            .padding(.top, 8)
                            .padding(.leading, 0)
                    }
                    
                    TextEditor(text: self.$message)
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .background(Color.clear)
                        .frame(maxHeight: .infinity)
                }
                .padding(.top, -10)
                .padding(.horizontal, 20)
                
                
//                if (self.image.count != 0) {
//                    Image(uiImage: UIImage(data: self.image)!)
//                        .resizable()
//                        .renderingMode(.original)
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(6)
//                        .padding()
//                }
                
                Spacer(minLength: 50)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        
        if (emojiPickerShowing == true) {
            Text("Scroll below to tag entry with emoji")
                .padding(.top, 30)
                .foregroundColor(.gray)
            EmojiPicker(selectedIndex: $selectedIndex, selected: self.$selected)
        }
        
        // Special Buttons
        HStack(spacing: 30) {
            
            
            //emoji button
            Button(action: { emojiPickerShowing.toggle()}) {
                ZStack{
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                    Text(emojiPickerShowing ? "😏" : "😶")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
            }
            .scaleEffect((emojiPickerShowing ? 1.76 : 1))
            
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1490374432)), radius: 5)
            
            //speech to text button
            // adapted from https://github.com/Cay-Zhang/SwiftSpeech
            SwiftSpeech.RecordButton()
                .swiftSpeechToggleRecordingOnTap(sessionConfiguration: sessionConfiguration, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                .onRecognizeLatest(update: $message)
                .scaleEffect(0.7)
                .padding(.horizontal, -12)
            
            // photo button
            Button(action: {
                    addPhotoShowing.toggle()
//                    self.show.toggle()
            }) {
                ZStack{
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                    Image(systemName: (addPhotoShowing ? "photo.on.rectangle.angled" : "photo.on.rectangle")).resizable()
                        .frame(width: 20, height: 17)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .scaleEffect((addPhotoShowing ? 1.76 : 1))
            .animation(.easeOut(duration: 0.2))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1490374432)), radius: 5)
//            .sheet(isPresented: self.$show) {
//                ImagePicker(show: self.$show, image: self.$image)
//            }
            
            //sparkles button
            Button(action: { addSpecialShowing.toggle() }) {
                ZStack{
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                    Image(systemName: (addSpecialShowing ? "sparkles" : "sparkle")).resizable()
                        .frame(width: 20, height: 20)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
            .scaleEffect((addSpecialShowing ? 1.76 : 1))
            .animation(.easeOut(duration: 0.2))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1490374432)), radius: 5)
            
            
            
        }.onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization()
        }
        .animation(.easeOut(duration: 0.2))
        
        //submit button
        Button( action: {
            
            // create note item
            let note = Note(context: self.moc)
            
            // get current data and format it
            dateFormatter.dateFormat = "MMM dd, yyyy | h:mm a"
            dateString = dateFormatter.string(from: date as Date)
            
            //assign vars on click
            note.id = UUID() //create id
            note.note = "\(message)" //input message
            note.createdAt = date //actual date to sort
            note.date = "\(dateString)" //formatted date to sort
            note.emoji = "\(selected)" // emoji
            note.stringLength = Double(message.count) // length of entry
//            note.img = self.image
            
            
            try? self.moc.save() //save inputted values
            
            message = "" //reset input

//            presentationMode.wrappedValue.dismiss() //dismiss popup on click

        }) {
            ZStack{
                Text("Save")
            }
            .disabled(message == "")
            .foregroundColor(message == "" ? .gray : .black)
            .font(Font.custom("Poppins-Regular", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .frame(width: 200, height: 50)
            .background(message == "" ? Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) : Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
            .cornerRadius(50)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct addNote_Previews: PreviewProvider {
    static var previews: some View {
        addNote()
    }
}
