//
//  GiftViewController.swift
//  PhotoEditorTestTask
//
//  Created by Kristina Grebneva on 23.08.2025.
//

import UIKit

final class GiftViewController: UIViewController {
    private let giftImageView = UIImageView()
    private let timerLabel = UILabel()
    private let container = UIView()
    private let stack = UIStackView()

    private var timer: Timer?
    private var endDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainer()
        configureGiftImage()
        configureTimerLabel()
        setConstraints()
        animateGift()
        startCountdown(minutes: 30)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
        giftImageView.layer.removeAllAnimations()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        container.layer.cornerRadius = container.bounds.width/2
    }
    
    deinit { stopTimer() }
    
    private func configureContainer() {
        container.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        container.clipsToBounds = true
        if #available(iOS 13.0, *) { container.layer.cornerCurve = .continuous }
    }
    
    private func configureGiftImage() {
        giftImageView.image = UIImage(named: DS.Asset.gift)
        giftImageView.contentMode = .scaleAspectFill
        giftImageView.clipsToBounds = true
    }
    
    private func configureTimerLabel() {
        timerLabel.textColor = .white
        timerLabel.font = .monospacedDigitSystemFont(ofSize: 22, weight: .semibold)
        timerLabel.adjustsFontForContentSizeCategory = true
        timerLabel.minimumScaleFactor = 0.7
    }
    
    private func setConstraints() {
        view.addSubview(container)
        container.addSubview(stack)
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = DS.Padding.s
        
        stack.addArrangedSubview(giftImageView)
        stack.addArrangedSubview(timerLabel)
        
        [container, stack, giftImageView, timerLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
            container.heightAnchor.constraint(equalTo: container.widthAnchor),
            
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -DS.Padding.m),
            stack.leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: DS.Padding.l),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -DS.Padding.l),
            
            giftImageView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.63),
            giftImageView.heightAnchor.constraint(equalTo: giftImageView.widthAnchor)
        ])
        
        addPriorities()
    }
    
    private func addPriorities() {
        let minW = container.widthAnchor.constraint(greaterThanOrEqualToConstant: DS.GiftContainerSizes.minW)
        let maxW = container.widthAnchor.constraint(lessThanOrEqualToConstant: DS.GiftContainerSizes.maxW)
        [minW, maxW].forEach { $0.priority = .defaultHigh; $0.isActive = true }
        
        giftImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        timerLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    // MARK: - timer logic
    private func startCountdown(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        let time = hours*3600 + minutes*60 + seconds
        endDate = Date().addingTimeInterval(TimeInterval(time))
        updateLabel()
        
        timer?.invalidate()
        let t = Timer(timeInterval: 1, repeats: true) { [weak self] _ in
            self?.tick()
        }
        RunLoop.main.add(t, forMode: .common)
        timer = t
    }
    
    private func tick() {
        guard updateLabel() else {
            stopTimer()
            return
        }
    }
    
    @discardableResult
    private func updateLabel() -> Bool {
        guard let endDate else { return false }
        let remaining = endDate.timeIntervalSinceNow
        
        if remaining <= 0 {
            timerLabel.text = "00:00:00"
            return false
        }
        
        timerLabel.text = remaining.asTimeString()
        return true
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

// MARK: - animation
extension GiftViewController {
    func animateGift() {
        rotate(times: 3)
    }
    
    private func rotate(times: Int) {
        guard times > 0 else {
            
            // pause
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.animateGift()
            }
            return
        }
        
        let rotation = CGAffineTransform(rotationAngle: -.pi/18)
        let duration = 0.15
        
        UIView.animate(withDuration: duration,
                       animations: { [weak self] in
            self?.giftImageView.transform = rotation
        }, completion: { [weak self] _ in
            UIView.animate(withDuration: duration,
                           animations: {
                self?.giftImageView.transform = .identity
            }, completion: { _ in
                self?.rotate(times: times - 1)
            })
        })
    }
}
