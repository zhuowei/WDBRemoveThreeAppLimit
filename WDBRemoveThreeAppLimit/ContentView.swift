//
//  ContentView.swift
//  WDBRemoveThreeAppLimit
//
//  Created by Zhuowei Zhang on 2023-01-31.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
      Button(action: {
        grant_full_disk_access { error in
          if let error = error {
            print(error)
            return
          }
          if !patch_installd() {
            print("can't patch installd")
          }
        }
      }) {
        Text("Go")
      }.padding(16)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
