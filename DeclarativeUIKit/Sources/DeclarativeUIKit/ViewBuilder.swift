//  Created by Windy on 31/12/23.

import UIKit

@resultBuilder
public enum ViewBuilder {
    public static func buildBlock(_ components: UIView...) -> [UIView] {
        components
    }
    
    public static func buildArray(_ components: [[UIView]]) -> [UIView] {
        Array(components.joined())
    }
}
