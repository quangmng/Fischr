//
//  HistoryItemView.swift
//  Fischr
//
//  Created by Cheuk Hei So on 25/10/2024.
//

import SwiftUI

struct HistoryItemView: View {
    var body: some View {
        VStack(alignment: .leading){
           Image("Bishop")
                .resizable()
                .frame(width: 15, height: 30)
                .padding(.bottom, 8)
                .center()
            
            HStack(spacing: 2){
                Text("White wins")
                    .font(.caption)
                    .center()
            }
            
            Text("Date of match")
                .font(.caption)
                .center()
                
            
        }
        .frame(width: 100, height: 100)
        .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.gray), lineWidth: 2)
        }
    }
}

#Preview {
    HistoryItemView()
}
