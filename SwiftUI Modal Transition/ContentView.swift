//
//  ContentView.swift
//  SwiftUI Modal Transition
//
//  Created by Momeks on 7/5/22.
//

import SwiftUI

struct ContentView: View {
	
	@Environment(\.viewController) private var viewControllerHolder: UIViewController?
	
	private var viewController: UIViewController? {
		self.viewControllerHolder
	}
	
	var body: some View {
		Button("Show Modal", action: {
			self.viewController?.present(style: .fullScreen, transitionStyle: .flipHorizontal) {
				SwiftUIView()
			}
		})
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

