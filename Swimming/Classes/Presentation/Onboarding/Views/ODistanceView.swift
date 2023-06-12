//
//  ODistanceView.swift
//  Swimming
//
//  Created by Андрей Чернышев on 12.06.2023.
//

import UIKit

final class ODistanceView: OSlideView {
    lazy var titleLabel = makeTitleLabel()
    lazy var scrollView = makeScrollView()
    lazy var distance1Button = makeDistanceButton(text: "Onboarding.Distance.Cell1".localized)
    lazy var distance2Button = makeDistanceButton(text: "Onboarding.Distance.Cell2".localized)
    lazy var distance3Button = makeDistanceButton(text: "Onboarding.Distance.Cell3".localized)
    lazy var distance4Button = makeDistanceButton(text: "Onboarding.Distance.Cell4".localized)
    lazy var distance5Button = makeDistanceButton(text: "Onboarding.Distance.Cell5".localized)
    lazy var distance6Button = makeDistanceButton(text: "Onboarding.Distance.Cell6".localized)
    lazy var continueButton = makeContinueButton()
    
    private lazy var buttons = [
        distance1Button,
        distance2Button,
        distance3Button,
        distance4Button,
        distance5Button,
        distance6Button
    ]
    
    override init(step: OnboardingView.Step) {
        super.init(step: step)
        
        makeConstraints()
        initialize()
        checkEnabled()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension ODistanceView {
    func initialize() {
        backgroundColor = Appearance.background
    }
    
    @objc
    func tapped(sender: UIButton) {
        guard let ageButton = sender as? OAgeButton else {
            return
        }
        
        buttons.forEach { $0.marked = false }
        
        ageButton.marked = true
        
        checkEnabled()
    }
    
    func checkEnabled() {
        let marked = buttons.contains(where: { $0.marked })
        continueButton.isHidden = !marked
        scrollView.contentInset.bottom = marked ? (ScreenSize.isIphoneXFamily ? 140.scale : 110.scale) : 20.scale
    }
}

// MARK: Make constraints
private extension ODistanceView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 120.scale : 52.scale),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            distance1Button.heightAnchor.constraint(equalToConstant: 80.scale),
            distance1Button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.scale),
            distance1Button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.scale),
            distance1Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.scale),
            distance1Button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.scale),
            distance1Button.topAnchor.constraint(equalTo: scrollView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            distance2Button.heightAnchor.constraint(equalToConstant: 80.scale),
            distance2Button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.scale),
            distance2Button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.scale),
            distance2Button.topAnchor.constraint(equalTo: distance1Button.bottomAnchor, constant: 16.scale)
        ])
        
        NSLayoutConstraint.activate([
            distance3Button.heightAnchor.constraint(equalToConstant: 80.scale),
            distance3Button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.scale),
            distance3Button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.scale),
            distance3Button.topAnchor.constraint(equalTo: distance2Button.bottomAnchor, constant: 16.scale)
        ])
        
        NSLayoutConstraint.activate([
            distance4Button.heightAnchor.constraint(equalToConstant: 80.scale),
            distance4Button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.scale),
            distance4Button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.scale),
            distance4Button.topAnchor.constraint(equalTo: distance3Button.bottomAnchor, constant: 16.scale)
        ])
        
        NSLayoutConstraint.activate([
            distance5Button.heightAnchor.constraint(equalToConstant: 80.scale),
            distance5Button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.scale),
            distance5Button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.scale),
            distance5Button.topAnchor.constraint(equalTo: distance4Button.bottomAnchor, constant: 16.scale)
        ])
        
        NSLayoutConstraint.activate([
            distance6Button.heightAnchor.constraint(equalToConstant: 80.scale),
            distance6Button.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.scale),
            distance6Button.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16.scale),
            distance6Button.topAnchor.constraint(equalTo: distance5Button.bottomAnchor, constant: 16.scale),
            distance6Button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.scale),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.scale),
            continueButton.heightAnchor.constraint(equalToConstant: 54.scale),
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ScreenSize.isIphoneXFamily ? -62.scale : -32.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension ODistanceView {
    func makeTitleLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(Appearance.white)
            .font(Fonts.Inter.bold(size: 24.scale))
            .lineHeight(28.8.scale)
            .textAlignment(.center)
        
        let view = UILabel()
        view.attributedText = "Onboarding.Distance.Title".localized.attributed(with: attrs)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.contentInset = UIEdgeInsets(top: 20.scale, left: 0, bottom: 20.scale, right: 0)
        view.backgroundColor = UIColor.clear
        view.showsVerticalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeDistanceButton(text: String) -> OAgeButton {
        let view = OAgeButton(age: text)
        view.backgroundColor = Appearance.black
        view.layer.cornerRadius = 10.scale
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
        scrollView.addSubview(view)
        return view
    }
    
    func makeContinueButton() -> GradientButton {
        let attrs = TextAttributes()
            .textColor(Appearance.black)
            .font(Fonts.Inter.semiBold(size: 16.scale))
        
        let view = GradientButton()
        view.gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        view.gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        view.gradientLayer.colors = [
            UIColor(integralRed: 6, green: 243, blue: 215).cgColor,
            UIColor(integralRed: 10, green: 203, blue: 236).cgColor
        ]
        view.layer.cornerRadius = 8.scale
        view.setAttributedTitle("Continue".localized.attributed(with: attrs), for: .normal)
        view.addTarget(self, action: #selector(onNext), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
