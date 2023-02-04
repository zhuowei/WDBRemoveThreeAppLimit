//
//  ContentView.swift
//  WDBRemoveThreeAppLimit
//
//  Created by Zhuowei Zhang on 2023-01-31.
//

import SwiftUI

struct ContentView: View {
  @State private var message = ""
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text(message)
      Button(action: {
        grant_full_disk_access { error in
          if let error = error {
            print(error)
            DispatchQueue.main.async {
              message = "Failed to get full disk access: \(error)"
            }
            return
          }
          if !patch_installd() {
            print("can't patch installd")
            DispatchQueue.main.async {
              message = "Failed to patch installd."
            }
            return
          }
          DispatchQueue.main.async {
            message = "Success."
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
