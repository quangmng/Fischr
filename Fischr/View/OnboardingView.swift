//
//  OnboardingView.swift
//  Fischr
//
//  Created by Quang Minh Nguyen on 24/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selection = 0
    @State private var showNextView = false
    var body: some View {
        ZStack {
            // TabView for multiple onboarding steps
            TabView(selection: $selection) {
                // Step 1
                OnboardingStepView(title: "Fischr", description: "The one-stop shop for Chess960, a chess derivative by Bobby Fischer!")
                    .tag(0)
                
                // Step 2
                OnboardingStepView(title: "Generate", description: "add text here")
                    .tag(1)
                
                // Step 3
                OnboardingStepView(title: "Play", description: "add text here")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .background(selection == 0 ? Color("FischrTab") :
                        selection == 1 ? Color("trackTab") :
                        selection == 2 ? Color("recommendTab") : Color.clear)
            .edgesIgnoringSafeArea(.all)
            .padding(.bottom)
            
            // Show "Get Started" button on the last page (Step 3)
            if selection == 2 {
                VStack {
                    Spacer()
                    Button(action: {
						
                    }) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .padding()
                }
            }
        }
    }
}

struct OnboardingStepView: View {
    let title: String
    let description: String
    
    @State private var animationCount = 1
    
    var body: some View {
        VStack(spacing: 20) {
            if title == "Fischr" {
                Image(systemName: "film.stack")
                    .symbolEffect(.bounce.up.byLayer, value: animationCount)
                    .font(.system(size: 50))
            } else if title == "Generate" {
                Image(systemName: "list.star")
                    .symbolEffect(.bounce.up.byLayer, value: animationCount)
                    .font(.system(size: 50))
            } else if title == "Recommend" {
                Image(systemName: "star.bubble.fill")
                    .symbolEffect(.bounce.up.byLayer, value: animationCount)
                    .font(.system(size: 50))
            }
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
