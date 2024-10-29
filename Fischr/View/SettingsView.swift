	//
	//  SettingsView.swift
	//  Fischr
	//
	//  Created by Cheuk Hei So on 25/10/2024.
	//

import SwiftUI


struct SettingsView: View {
	@State private var isHapticOn = true
	@State private var isAboutTapped = false
	@State private var isNotifSettingTapped = false
	@State private var isHealthDataOn = false
	@State private var clearAll = false
	
	var body: some View {
		NavigationStack {
			List {
				Section {
					Button{
						isAboutTapped.toggle()
					} label: {
						Text("About this app")
					}
					.foregroundStyle(.blue)
					
					
				}
			}
			.navigationTitle("Settings")
			.sheet(isPresented: $isAboutTapped) {
				NavigationStack {
					AboutSheetView() // Custom content in the sheet
						.toolbar{
							ToolbarItem(placement: .navigationBarTrailing) {
								Button() {
									isAboutTapped = false // Close sheet manually
								} label: {
									CloseCross()
										.frame(width: 36, height: 36)
										.padding(.top)
								}
							}
						}
				}
				
			}
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}

struct AboutSheetView: View {
	
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		VStack(spacing: 20) {
			Text("Fischr App")
				.font(.custom("VoidSemiBold", size: 55))
				.bold()
			
			Text("Version 1.0.0")
				.font(.headline)
				.foregroundColor(.gray)
			
			Text("Developed by")
				.font(.custom("VoidRegular", size: 45))
			VStack {
				Text("Quang Minh Nguyen🇻🇳")
				Text("Cheuk Hei So🇭🇰")
				Text("Wende Zhou🇨🇳")
			}
			.font(.custom("VoidRegular", size: 25))
			
			
//			Button("Close") {
//					// Close the sheet when tapped
//				if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//					windowScene.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
//				}
//			}
//			.padding()
//			.foregroundColor(.white)
//			.background(Color.blue)
//			.cornerRadius(15)
		}
		.padding()
	}
}
