//
//  HomeAddTrainingCell.swift
//  Soccer
//
//  Created by Андрей Чернышев on 10.03.2023.
//

import UIKit

final class HomeAddTrainingCell: UITableViewCell {
    lazy var button = makeButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension HomeAddTrainingCell {
    func initialize() {
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
        selectionStyle = .none
    }
}

// MARK: Make constraints
private extension HomeAddTrainingCell {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.scale),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.scale),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension HomeAddTrainingCell {
    func makeButton() -> GradientButton {
        let attrs = TextAttributes()
            .textColor(Appearance.black)
            .font(Fonts.Inter.semiBold(size: 16.scale))
            .lineHeight(19.2.scale)
        
        let view = GradientButton()
        view.gradientLayer.colors = [
            UIColor(integralRed: 6, green: 243, blue: 215).cgColor,
            UIColor(integralRed: 10, green: 203, blue: 236).cgColor
        ]
        view.gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        view.gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        view.setAttributedTitle("Home.AddTraining".localized.attributed(with: attrs), for: .normal)
        view.layer.cornerRadius = 8.scale
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        return view
    }
}
