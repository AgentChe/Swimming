//
//  OGenderButton.swift
//  Soccer
//
//  Created by Андрей Чернышев on 01.02.2023.
//

import UIKit

final class OGenderButton: UIButton {
    var marked = false {
        didSet {
            update()
        }
    }
    
    let gender: Gender
    
    lazy var iconView = makeIconView()
    lazy var nameLabel = makeLabel()
    
    init(gender: Gender) {
        self.gender = gender
        
        super.init(frame: .zero)
        
        makeConstraints()
        update()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension OGenderButton {
    func update() {
        layer.borderWidth = marked ? 1.scale : 0
        layer.borderColor = marked ? Appearance.primary.cgColor : UIColor.clear.cgColor
    }
    
    var icon: UIImage? {
        switch gender {
        case .male:
            return UIImage(named: "Onboarding.Gender.Male")
        case .female:
            return UIImage(named: "Onboarding.Gender.Female")
        }
    }
    
    var name: String {
        switch gender {
        case .male:
            return "Onboarding.Gender.Male".localized
        case .female:
            return "Onboarding.Gender.Female".localized
        }
    }
}

// MARK: Make constraints
private extension OGenderButton {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12.scale),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension OGenderButton {
    func makeIconView() -> UIImageView {
        let view = UIImageView()
        view.image = icon
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(Appearance.white)
            .font(Fonts.Inter.regular(size: 16.scale))
            .lineHeight(25.6.scale)
            .textAlignment(.center)
        
        let view = UILabel()
        view.attributedText = name.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
