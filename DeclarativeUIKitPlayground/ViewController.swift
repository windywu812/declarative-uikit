//
//  ViewController.swift
//  DeclarativeUIKitPlayground
//
//  Created by Windy on 04/01/24.
//

import UIKit
import DeclarativeUIKit
import Combine

class ViewController: UIViewController {

    @State private var text: String? = "Hello World"
    @State private var isEnabled: Bool = false
    @State private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = VStackView {
            HStackView(alignment: .center) {
                UIImageView(image: .swiftLogo)
                    .width(100)
                    .height(100)
                    .cornerRadius(16)
                VStackView(alignment: .leading, spacing: 4) {
                    UILabel()
                        .text("Title")
                        .font(.preferredFont(forTextStyle: .headline))
                    UILabel()
                        .text(.dummy)
                        .numberOfLines($isExpanded.map { $0 ? 0 : 3 })
                        .font(.preferredFont(forTextStyle: .body))
                    UIButton(type: .system)
                        .title("Show More")
                        .onTap { [weak self] in
                            self?.isExpanded.toggle()
                        }
                }
            }
        }.layoutMargins(.init(all: 16))
        
        view.addSubview(scrollView, constraint: .fill)
    }
}

private extension String {
    static var dummy: String {
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    }
}
