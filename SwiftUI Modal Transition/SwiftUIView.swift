//
//  SwiftUIView.swift
//  SUI CrossDisolve
//
//  Created by Momeks on 7/5/22.
//

import SwiftUI

struct SwiftUIView: View {

	@Environment(\.presentationMode) var presentationMode
    var body: some View {
		VStack {
		Text("Hello, World!")
				.font(.largeTitle)
			
			Image("image")
				.resizable()
				.scaledToFit()
		}
		
		Button("Close", action: {
			presentationMode.wrappedValue.dismiss()
		})
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
