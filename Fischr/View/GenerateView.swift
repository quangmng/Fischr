//
//  GenerateView.swift
//  Fischr
//
//  Created by Cheuk Hei So on 25/10/2024.
//

import SwiftUI

struct GenerateView: View {
    
    @Binding var isFavourite: Bool
    
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
                        
                        
                        HStack{
                            Text("History (10 recent)")
                                .font(.headline)
                                .leading()
                                .padding(.horizontal)
                            
                            NavigationLink{
                                PlayView() //suppose to navigate to all generation view
                            }label: {
                                Text("All")
                                    .foregroundColor(.white)
                                    .frame(width: 50, height: 1)
                                    .padding()
                                    .background(Color.black)
                                    .cornerRadius(25)
                            }
                            .padding()
                            .frame(height: 5)
                            
                        }
                        ScrollView(.horizontal){
                            
                            HistoryItemView(isFavourite: $isFavourite)
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
    GenerateView(isFavourite: .constant(false))
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

//struct GenerateView_Previews: PreviewProvider {
//    static var previews: some View {
//        let gvm = GenerateViewModel()
//
//        GenerateView(ge: .constant(gvm.storedGeneration[0]))
//    }
//}
