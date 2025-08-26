//  Created by Kristina Grebneva on 23.08.2025.

import UIKit

final class GiftView: UIView {
    
    private let giftImageView = UIImageView()
    private let timerLabel = UILabel()

    private var timer: Timer?
    private var endDate: Date?
    private var isAnimating = false
    
    private var hasTimeRemaining: Bool {
        (endDate?.timeIntervalSinceNow ?? 0) > 0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContainer()
        configureGiftImage()
        configureTimerLabel()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width/2
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window == nil {
            // if left the screen
            stopTimer()
            giftImageView.layer.removeAllAnimations()
            isAnimating = false
        } else {
            // if return to the screen
            resumeTimerIfNeeded()
            startAnimationIfNeeded()
        }
    }
    
    deinit {
        stopTimer()
        giftImageView.layer.removeAllAnimations()
    }
    
    private func configureContainer() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        clipsToBounds = true
        if #available(iOS 13.0, *) { layer.cornerCurve = .continuous }
    }
    
    private func configureGiftImage() {
        giftImageView.image = UIImage(named: DS.Asset.gift)
        giftImageView.contentMode = .scaleAspectFill
        giftImageView.clipsToBounds = true
    }
    
    private func configureTimerLabel() {
        timerLabel.textColor = .white
        timerLabel.font = .monospacedDigitSystemFont(ofSize: DS.FontSize.giftFont, weight: .semibold)
        timerLabel.minimumScaleFactor = 0.5
        timerLabel.adjustsFontSizeToFitWidth = true
        timerLabel.numberOfLines = 1
        timerLabel.text = "00:00:00"
    }
    
    private func setConstraints() {
        addSubviews(giftImageView, timerLabel)
        [giftImageView, timerLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        let padding = UILayoutGuide()
        addLayoutGuide(padding)
        
        NSLayoutConstraint.activate([
            giftImageView.topAnchor.constraint(equalTo: topAnchor),
            giftImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            giftImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.63),
            giftImageView.heightAnchor.constraint(equalTo: giftImageView.widthAnchor),
            
            padding.topAnchor.constraint(equalTo: giftImageView.bottomAnchor),
            padding.centerXAnchor.constraint(equalTo: centerXAnchor),
            padding.heightAnchor.constraint(equalTo: giftImageView.heightAnchor, multiplier: 0.05),
            
            timerLabel.topAnchor.constraint(equalTo: padding.bottomAnchor),
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.widthAnchor.constraint(equalTo: giftImageView.widthAnchor, multiplier: 0.87),
            
            heightAnchor.constraint(equalTo: widthAnchor)
        ])
        
        addPriorities()
    }
    
    private func addPriorities() {
        giftImageView.setContentCompressionResistancePriority(.required, for: .vertical)
        timerLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    // text stroke
    private func outlinedText(_ text: String,
                              font: UIFont,
                              fill: UIColor = .white,
                              stroke: UIColor = .black,
                              strokeWidth: CGFloat? = nil) -> NSAttributedString {
        let w = strokeWidth ?? max(1, font.pointSize * 0.12)
        return NSAttributedString(
            string: text,
            attributes: [
                .font: font,
                .foregroundColor: fill,
                .strokeColor: stroke,
                .strokeWidth: -w
            ]
        )
    }
    
    // MARK: - timer logic
    private func resumeTimerIfNeeded() {
        guard timer == nil, endDate != nil else { return }
        updateLabel()
        let t = Timer(timeInterval: 1, repeats: true) { [weak self] _ in
            self?.tick()
        }
        RunLoop.main.add(t, forMode: .common)
        timer = t
    }
    
    private func tick() {
        guard updateLabel() else {
            stopTimer()
            stopAnimation()
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
        
        let text = remaining.asTimeString()
        timerLabel.attributedText = outlinedText(text, font: timerLabel.font)
        return true
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: - animation
    
    private func startAnimationIfNeeded() {
        guard !isAnimating, hasTimeRemaining else { return }
        isAnimating = true
        animateGift()
    }
    
    private func animateGift() {
        guard isAnimating, hasTimeRemaining, window != nil else { return }
        rotate(times: 3)
    }
    
    private func rotate(times: Int) {
        guard isAnimating, hasTimeRemaining, window != nil else { return }

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
    
    private func stopAnimation() {
        isAnimating = false
        giftImageView.layer.removeAllAnimations()
    }
    
    // MARK: - configure with data
    func configure(with gift: GiftDTO) {
        let seconds = (gift.hours ?? 0) * 3600 + (gift.minutes ?? 0) * 60 + (gift.seconds ?? 0)
        endDate = Date().addingTimeInterval(TimeInterval(seconds))
        
        if window != nil {
            resumeTimerIfNeeded()
            startAnimationIfNeeded()
        }
    }
}


