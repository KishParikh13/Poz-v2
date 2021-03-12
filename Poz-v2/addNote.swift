import SwiftUI
import SwiftSpeech
import PhotoLibraryPicker

struct addNote: View {
    
    //get data from CoreData
    @Environment(\.managedObjectContext) var moc
    
    //vars
    @State private var message: String = ""
    @State private var emoji: String = ""
    
    @Environment(\.presentationMode) var presentationMode //check if pop up active
    
    @State var selected = ""
    @State private var selectedIndex: Int = 0
    
    
    //audio to text
    
    
    var sessionConfiguration: SwiftSpeech.Session.Configuration
    
    public init(sessionConfiguration: SwiftSpeech.Session.Configuration) {
        UITextView.appearance().backgroundColor = .clear
        
        self.sessionConfiguration = sessionConfiguration
    }
    
    public init(locale: Locale = .current) {
        self.init(sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale))
    }
    
    public init(localeIdentifier: String) {
        self.init(locale: Locale(identifier: localeIdentifier))
    }
    
    
    
    @State private var emojiPickerShowing: Bool = false;
    @State private var addPhotoShowing: Bool = false;
    @State private var addSpecialShowing: Bool = false;

    
    @State var pictures = [Picture]()

    
    var body: some View {
        
        //today
        HStack {
            Spacer()
            Text("Today")
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
        .padding(.top, 16)
        .padding(.horizontal, 20)
        
        //emoji putput
        Text("\(selected)")
            .font(.system(size: 48))
        
        //text input
        VStack {
            ScrollView {
                ZStack (alignment: .topLeading) {
                    if message.isEmpty {
                        Text("What's on your mind?")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                            .padding(.leading, 7)
                    }
                    
                    TextEditor(text: self.$message)
                        .background(Color.clear)
                        .frame(maxHeight: .infinity)
                }
                .padding(.top, -10)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 50)
            
                ForEach(pictures) { picture in
                    picture.toImage()
                        .resizable().scaledToFit().aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal, 20)
            }
        }
        
        if (emojiPickerShowing == true) {
            Text("Scroll below to tag entry with emoji")
                .padding(.top, 30)
                .foregroundColor(.gray)
            EmojiPicker(selectedIndex: $selectedIndex, selected: self.$selected)
        }
        
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
            .animation(.easeOut(duration: 0.2))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1490374432)), radius: 5)
            
            //speech to text button
            // adapted from https://github.com/Cay-Zhang/SwiftSpeech
            SwiftSpeech.RecordButton()
                .swiftSpeechToggleRecordingOnTap(sessionConfiguration: sessionConfiguration, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                .onRecognizeLatest(update: $message)
                .scaleEffect(0.7)
                .padding(.horizontal, -12)
            
            // photo button
            Button(action: { addPhotoShowing.toggle() }) {
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
            .sheet(isPresented: $addPhotoShowing, content: { PhotoLibraryPicker(self.$pictures) })
            
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
        
        //submit button
        Button("Submit") {
            
            // create note item
            let note = Note(context: self.moc)
            
            // get current data and format it
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M/d/yy h:mm a"
            let dateString = dateFormatter.string(from: date as Date)
            
            //assign vars on click
            note.id = UUID() //create id
            note.note = "\(message)" //input message
            note.createdAt = date //actual date to sort
            note.date = "\(dateString)" //formatted date to sort
            note.emoji = "\(selected)" // emoji
            note.stringLength = Double(message.count) // length of entry
            
            
            try? self.moc.save() //save inputted values
            
            message = "" //reset input

            presentationMode.wrappedValue.dismiss() //dismiss popup on click

        }
        .disabled(message == "")
        .foregroundColor(message == "" ? .gray : .black)
        .font(Font.custom("Poppins-Regular", size: 20))
        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        .frame(width: 200, height: 50)
        .background(message == "" ? Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)) : Color(#colorLiteral(red: 0.9853331447, green: 0.7925021052, blue: 0.3908675313, alpha: 1)))
        .cornerRadius(50)
        .padding(.horizontal, 20)
        .padding(.bottom, 60)
    }
    
}


struct addNote_Previews: PreviewProvider {
    static var previews: some View {
        addNote()
    }
}
