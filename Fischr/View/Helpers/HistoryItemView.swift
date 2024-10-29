//
//  HistoryItemView.swift
//  Fischr
//
//  Created by Cheuk Hei So on 25/10/2024.
//

import SwiftUI

struct HistoryItemView: View {
    
    @State private var pvm = PositionViewModel()
    @State var positionGenerated: String
    @State var isFavourite: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(pvm.vPosition[0])
                    .resizable()
                    .frame(width: 20, height: 40)
                    .padding(.bottom, 8)
                    .traling()
    
                Button{
                    isFavourite.toggle()
                }label: {
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .foregroundStyle(isFavourite ? .red : .white)
                }
                .background(Circle()
                    .frame(width: 100, height: 40))
                .padding(.horizontal)
                .padding(.bottom, 40)
                .traling()
            }
            
            HStack(spacing: 2){
                Text(positionGenerated)
					.font(.custom("VoidSemiBold", size: 35))
                    .center()
            }
            
            
        }
        .frame(width: 135, height: 135)
        .overlay{
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.gray), lineWidth: 2)
        }
    }
}

#Preview {
    HistoryItemView(positionGenerated: "1" , isFavourite: true)
}


//MARK:
//think a way to combine this with coredata
//struct HistoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        let gvm = GenerateViewModel()
//
//        HistoryItemView(ge: .constant(gvm.storedGeneration[0]))
//    }
//}
