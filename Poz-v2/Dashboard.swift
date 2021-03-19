import SwiftUI

struct Dashboard: View {
    
    @State var index = 1
    @State var offset : CGFloat = 0
    
    var body: some View {
        VStack {
//            appTopBar(index: self.$index, offset: self.$offset)
            
            if (index == 0) {
//                NotesList()
            } else if (index == 1) {
                Stats()
            }
       }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
