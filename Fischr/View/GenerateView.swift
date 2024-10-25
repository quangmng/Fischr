//
//  GenerateView.swift
//  Fischr
//
//  Created by Cheuk Hei So on 25/10/2024.
//

import SwiftUI

struct GenerateView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    Text("Generate")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .leading()
                    
                    VStack{
                        Text("Modes")
                            .font(.headline)
                            .leading()
                            .padding(.horizontal)
                        
                        ZStack(alignment: .bottomLeading){
                            Image("King")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()
                            
                            Text("Random")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                        }
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                        HStack{
                            ZStack(alignment: .bottomLeading){
                                Image("Queen")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 160, height: 130)
                                    .clipped()
                                
                                Text("By Number")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .background(Color.gray.opacity(0.7))
                            .cornerRadius(20)
                            .padding()
                            .leading()
                            
                            ZStack(alignment: .bottomLeading){
                                Image("Pawns")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 160, height: 130)
                                    .clipped()
                                
                                Text("Pieces > Pos.")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .background(Color.gray.opacity(0.7))
                            .cornerRadius(20)
                            .padding()
                        }
                        
                        
                        
                        Text("History (10 recent)")
                            .font(.headline)
                            .leading()
                            .padding(.horizontal)
                        ScrollView(.horizontal){
                            
                            HistoryItemView()
                                .padding()
                            
                            // Use ForEach loop to display recent matches using history Item View
                            
                            //                        ForEach{
                            //
                            //                        }
                            
                            
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    GenerateView()
}



// MARK: Modify ideas
// create seperate card view and work with navigation Link using ForEachLoop ?


// The code below does successfully navigate but random bugs appeare
///.onTapGesture {
//pTapped.toggle()
//}
//NavigationLink("", destination: PlayView(), isActive: $pTapped)
//
//}
