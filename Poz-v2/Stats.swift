//
//  Stats.swift
//  Poz-v2
//
//  Created by Kish Parikh on 3/3/21.
//

import SwiftUI
import SwiftUICharts

struct Stats: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) var notes: FetchedResults<Note>
    
    @State var chartData: [Double] = []
    
    var body: some View {
        VStack (spacing: 20){
            HStack {
                
                MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Mood")
                
            }
           
            Button(action: {
                chartData = [8,23,54,32,12,37,7,23,43]
            }) {
                Text("Press me")
            }
            
            LineChartView(data: chartData, title: "Consistency", form: ChartForm.large) // legend is optional
            Spacer()
        }
        .padding(.top, 20)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
