# Description

Simple UIKit extension for declarative UIKit.

# Usage
## Code
```swift
@State private var isExpanded = false

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
```
## Result
![Simulator Screen Recording - iPhone SE (3rd generation) - 2024-01-05 at 22 23 18](https://github.com/windywu812/declarative-uikit/assets/63775386/bcbf2012-4ee7-49b7-af4e-d820504a1f7a)
