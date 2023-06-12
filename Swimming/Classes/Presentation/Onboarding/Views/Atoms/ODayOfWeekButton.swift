//
//  ODayOfWeekButton.swift
//  Soccer
//
//  Created by Андрей Чернышев on 02.02.2023.
//

import UIKit

final class ODayOfWeekButton: GradientButton {
    lazy var marked = false {
        didSet {
            update()
        }
    }
    
    lazy var label = makeLabel()
    
    let dayOfWeek: DayOfWeek
    
    init(dayOfWeek: DayOfWeek) {
        self.dayOfWeek = dayOfWeek
        
        super.init(frame: .zero)
        
        makeConstraints()
        update()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = max(frame.width, frame.height) / 2
    }
}

// MARK: Private
private extension ODayOfWeekButton {
    func update() {
        layer.borderWidth = marked ? 0 : 1.scale
        layer.borderColor = marked ? UIColor.clear.cgColor : Appearance.white.withAlphaComponent(0.1).cgColor
        
        let markedColors = [
            UIColor(integralRed: 114, green: 131, blue: 255).cgColor,
            UIColor(integralRed: 36, green: 62, blue: 227).cgColor
        ]
        let unmarkedColors = [
            Appearance.black.cgColor,
            Appearance.black.cgColor
        ]
        gradientLayer.colors = marked ? markedColors : unmarkedColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }
    
    var text: String {
        switch dayOfWeek {
        case .su:
            return "Onboarding.DaysOfWeek.Su".localized
        case .mo:
            return "Onboarding.DaysOfWeek.Mo".localized
        case .tu:
            return "Onboarding.DaysOfWeek.Tu".localized
        case .we:
            return "Onboarding.DaysOfWeek.We".localized
        case .th:
            return "Onboarding.DaysOfWeek.Th".localized
        case .fr:
            return "Onboarding.DaysOfWeek.Fr".localized
        case .sa:
            return "Onboarding.DaysOfWeek.Sa".localized
        }
    }
}

// MARK: Make constraints
private extension ODayOfWeekButton {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension ODayOfWeekButton {
    func makeLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(Appearance.white)
            .font(Fonts.Inter.regular(size: 16.scale))
            .lineHeight(25.6.scale)
            .textAlignment(.center)
        
        let view = UILabel()
        view.attributedText = text.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
