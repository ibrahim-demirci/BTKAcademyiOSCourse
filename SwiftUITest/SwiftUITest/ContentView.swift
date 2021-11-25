//
//  ContentView.swift
//  SwiftUITest
//
//  Created by İbrahim Demirci on 25.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Hello, Swift UI!")
                .padding()
            Spacer()
            Text("Hello").foregroundColor(.green)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
