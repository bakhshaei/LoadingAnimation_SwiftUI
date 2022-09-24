//
//  ContentView.swift
//  LoadingAnimation
//
//  Created by Bakhshaei on 8/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoadingView()
            //.rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
