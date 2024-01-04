//  Created by Windy on 31/12/23.

import UIKit

public final class VStackView: UIStackView {
    
    public init(
        alignment: UIStackView.Alignment = .fill,
        spacing: CGFloat = 8,
        distribution: UIStackView.Distribution = .fill,
        @ViewBuilder views: () -> [UIView]
    ) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
        translatesAutoresizingMaskIntoConstraints = false
        views().forEach(addArrangedSubview)
        axis = .vertical
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

