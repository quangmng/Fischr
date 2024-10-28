//
//  SettingsView.swift
//  Fischr
//
//  Created by Cheuk Hei So on 25/10/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("Settings")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .leading()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}