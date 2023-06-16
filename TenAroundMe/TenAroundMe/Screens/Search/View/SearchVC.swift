import UIKit

public class SearchVC: UIView {
    
    private var currentFrameIndex: Int = 1

    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        return UIPanGestureRecognizer(target: self, action: #selector(self.didPanDrawer(_:)))
    }()
    
    private var borderLayer: CAShapeLayer?
    private var shapeLayer: CAShapeLayer?
    private var currentLineFrame: CGRect = .zero

    public convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }

    public init() {
        super.init(frame: .zero)
        setupView(for: currentFrameIndex)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func toggleUp() {
        print("--> Index: \(currentFrameIndex)")
        if currentFrameIndex >= 0 {
            currentFrameIndex -= 1
            updateViewFrame(for: currentFrameIndex)
        } else { return }
    }
    
    public func toggleDown() {
        print("--> Index: \(currentFrameIndex)")
        if currentFrameIndex <= 3  {
            currentFrameIndex += 1
            updateViewFrame(for: currentFrameIndex)
        } else { return }
    }
}

private extension SearchVC {
    
    func setupView(for frameIndex: Int) {
        frame = frame(for: frameIndex)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.525)
        layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        layer.masksToBounds = true

        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(
                width: Constants.cornerRadius,
                height: Constants.cornerRadius
            )
        )

        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer

        let grooveSize: CGSize = CGSize(width: 35.0, height: 2)

        let x: CGFloat = (bounds.size.width / 2.0) - (grooveSize.width / 2.0)
        let y: CGFloat = bounds.size.height - (grooveSize.height * 3.025)

        let linePath = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: grooveSize.width, height: grooveSize.height), cornerRadius: 10)

        shapeLayer = CAShapeLayer()
        shapeLayer?.path = linePath.cgPath
        shapeLayer?.strokeColor = UIColor.white.withAlphaComponent(0.625).cgColor
        shapeLayer?.lineWidth = grooveSize.height
        shapeLayer?.fillColor = UIColor.clear.cgColor

        layer.addSublayer(shapeLayer!)

        addGestureRecognizer(panGestureRecognizer)
    }
    
    func updateViewFrame(for index: Int) {
        let newFrame = frame(for: index)
        let animationDuration = 0.5

        UIView.animate(
            withDuration: animationDuration,
            delay: 0.0,
            usingSpringWithDamping: 2.0,
            initialSpringVelocity: 0.75,
            options: .curveEaseInOut,
            animations: {
                self.frame = newFrame
                self.layoutIfNeeded()

                self.borderLayer?.path = UIBezierPath(
                    roundedRect: self.bounds,
                    byRoundingCorners: [.bottomLeft, .bottomRight],
                    cornerRadii: CGSize(
                        width: Constants.cornerRadius,
                        height: Constants.cornerRadius
                    )
                ).cgPath

                let grooveSize: CGSize = CGSize(width: 35.0, height: 2)
                let x: CGFloat = (self.bounds.size.width / 2.0) - (grooveSize.width / 2.0)
                let y: CGFloat = self.bounds.size.height - (grooveSize.height * 3.025)
                self.currentLineFrame = CGRect(x: x, y: y, width: grooveSize.width, height: grooveSize.height)
                self.shapeLayer?.path = UIBezierPath(roundedRect: self.currentLineFrame, cornerRadius: 10).cgPath
            },
            completion: nil
        )
    }
    
    @objc private func didPanDrawer(_ gestureRecognizer: UIPanGestureRecognizer) {
        let velocity = gestureRecognizer.velocity(in: self)

        if gestureRecognizer.state == .ended {
            if velocity.y > 0 {
                toggleDown()
            } else if velocity.y < 0 {
                toggleUp()
            }
        }
        gestureRecognizer.setTranslation(CGPoint.zero, in: self)
    }


    func frame(for index: Int) -> CGRect {
        switch index {
        case 0:
            return minFrame()
        case 1:
            return mediumFrame()
        case 2:
            return largeFrame()
        case 3:
            return maxFrame()
        default:
            return mediumFrame()
        }
    }
}

private extension SearchVC {
    func minFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: -(Constants.viewHeight - Constants.smallVisibleHeight),
            width: Constants.viewWidth,
            height: Constants.viewHeight
        )
    }

    func mediumFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: -(Constants.viewHeight - Constants.mediumVisibleHeight),
            width: Constants.viewWidth,
            height: Constants.viewHeight
        )
    }

    func largeFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: -(Constants.viewHeight - Constants.largeVisibleHeight),
            width: Constants.viewWidth,
            height: Constants.viewHeight
        )
    }
    
    func maxFrame() -> CGRect {
        return CGRect(
            x: 0.0,
            y: -(Constants.viewHeight - Constants.maxVisibleHeight),
            width: Constants.viewWidth,
            height: Constants.viewHeight
        )
    }
}

private extension SearchVC {
    struct Constants {
        static let viewHeight: CGFloat = UIScreen.main.bounds.size.height - Constants.minimumVisibleHeight
        static let viewWidth: CGFloat = UIScreen.main.bounds.size.width
        static let minimumVisibleHeight: CGFloat = 76.0
        static let smallVisibleHeight: CGFloat = 110.0
        static let mediumVisibleHeight: CGFloat = 150.0 // TODO: make these aspect ratio
        static let largeVisibleHeight: CGFloat = 250.0
        static let maxVisibleHeight: CGFloat = 600.0
        static let cornerRadius: CGFloat = 40.0
        static let grabberSize: CGSize = CGSize(width: 75.0, height: 8.0)
    }
}

