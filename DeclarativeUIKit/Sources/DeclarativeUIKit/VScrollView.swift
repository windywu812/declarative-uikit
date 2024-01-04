//
//  VScrollView.swift
//
//
//  Created by Windy on 04/01/24.
//

import UIKit

public final class VScrollView: UIView {

    public init(
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 8,
        distribution: UIStackView.Distribution = .fill,
        layoutMargins: UIEdgeInsets = .init(all: 0),
        @ViewBuilder views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        let scrollView = UIScrollView()
        let stackView = VStackView(
            alignment: alignment,
            spacing: spacing,
            distribution: distribution,
            views: views
        ).layoutMargins(layoutMargins)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(scrollView)
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

