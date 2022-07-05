//
//  ViewControllerHolder.swift
//  SUI CrossDisolve
//
//  Created by Momeks on 7/5/22.
//

import UIKit
import SwiftUI

struct ViewControllerHolder {
	weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
	static var defaultValue: ViewControllerHolder {
		return ViewControllerHolder(value: UIApplication.shared.mainKeyWindow?.rootViewController)
	}
}

extension EnvironmentValues {
	var viewController: UIViewController? {
		get { return self[ViewControllerKey.self].value }
		set { self[ViewControllerKey.self].value = newValue }
	}
}

extension UIViewController {
	func present<Content: View>(style: UIModalPresentationStyle = .automatic, transitionStyle: UIModalTransitionStyle = .coverVertical, @ViewBuilder builder: () -> Content) {
		let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
		toPresent.modalPresentationStyle = style
		toPresent.modalTransitionStyle = transitionStyle
		toPresent.rootView = AnyView(
			builder()
				.environment(\.viewController, toPresent)
		)
		self.present(toPresent, animated: true, completion: nil)
	}
}

extension UIApplication {
		var mainKeyWindow: UIWindow? {
		get {
			if #available(iOS 13, *) {
				return connectedScenes
					.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
					.first { $0.isKeyWindow }
			} else {
				return keyWindow
			}
		}
	}
}
