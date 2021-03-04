import SwiftUI

struct EnterName: View {
    
    //get data from CoreData
    //@Environment(\.managedObjectContext) var mocuser
    //@FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
    
    @State public var username: String = ""
    @State public var isEditing = false
    
    var body: some View {
        VStack {

            //heading text
            EnterName_Text()
            
            // text field
            TextField( "First name", text: $username, onEditingChanged: {
                        
                (changed) in print("Username onEditingChanged - \(changed)")
                
//                let user = User(context: self.mocuser)
//                user.id = UUID() //create id
//                user.name = "\(username)" //input message
                
            })
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .padding(.horizontal, 40)
                .padding(.bottom, 100)
                .font(Font.custom("Poppins-Regular", size: 16))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        //.navigationBarBackButtonHidden(true)
    }
}

// heading text
struct EnterName_Text: View {
    var body: some View {
        Spacer()
        Text("Enter Your Name")
            .font(Font.custom("Blueberry Regular", size: 40))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .padding(.top, 75)
        Text("(Optional) - but why not!")
            .font(Font.custom("Poppins-Regular", size: 16))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
    }
}
