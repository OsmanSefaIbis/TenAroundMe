////
////  SearchVC.swift
////  TenAroundMe
////
////  Created by Sefa İbiş on 16.06.2023.
////

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var topSheetView: UIView!
    
    private lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        return UIPanGestureRecognizer(target: self, action: #selector(didPanDrawer(_:)))
    }()
    
    private var borderLayer: CAShapeLayer?
    private var shapeLayer: CAShapeLayer?
    private var currentLineFrame: CGRect = .zero
    
    let viewModel = SearchVM()
    
    public convenience init(backgroundColor: UIColor) {
        self.init()
        topSheetView.backgroundColor = backgroundColor.withAlphaComponent(0.525)
        topSheetView.frame = UIScreen.main.bounds
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setupView(for: viewModel.currentFrameIndex)
    }

}

extension SearchVC {
    
    func setupView(for frameIndex: Int) {
        
        topSheetView.frame = frame(for: frameIndex)
        topSheetView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.525)
        topSheetView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        topSheetView.layer.masksToBounds = true

        let maskPath = UIBezierPath(
            roundedRect: topSheetView.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(
                width: Constants.cornerRadius,
                height: Constants.cornerRadius
            )
        )

        let maskLayer = CAShapeLayer()
        maskLayer.frame = topSheetView.bounds
        maskLayer.path = maskPath.cgPath
        topSheetView.layer.mask = maskLayer

        let grabberSize: CGSize = CGSize(width: 35.0, height: 2)

        let x: CGFloat = (topSheetView.bounds.size.width / 2.0) - (grabberSize.width / 2.0)
        let y: CGFloat = topSheetView.bounds.size.height - (grabberSize.height * 3.025)

        let linePath = UIBezierPath(roundedRect: CGRect(x: x, y: y, width: grabberSize.width, height: grabberSize.height), cornerRadius: 10)

        shapeLayer = CAShapeLayer()
        shapeLayer?.path = linePath.cgPath
        shapeLayer?.strokeColor = UIColor.white.withAlphaComponent(0.625).cgColor
        shapeLayer?.lineWidth = grabberSize.height
        shapeLayer?.fillColor = UIColor.clear.cgColor

        topSheetView.layer.addSublayer(shapeLayer!)

        topSheetView.addGestureRecognizer(panGestureRecognizer)
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
            animations: { [weak self] in
                guard let self else { return }
                self.topSheetView.frame = newFrame
                self.topSheetView.layoutIfNeeded()

                self.borderLayer?.path = UIBezierPath(
                    roundedRect: topSheetView.bounds,
                    byRoundingCorners: [.bottomLeft, .bottomRight],
                    cornerRadii: CGSize(
                        width: Constants.cornerRadius,
                        height: Constants.cornerRadius
                    )
                ).cgPath

                let grooveSize: CGSize = CGSize(width: 35.0, height: 2)
                let x: CGFloat = (topSheetView.bounds.size.width / 2.0) - (grooveSize.width / 2.0)
                let y: CGFloat = topSheetView.bounds.size.height - (grooveSize.height * 3.025)
                self.currentLineFrame = CGRect(x: x, y: y, width: grooveSize.width, height: grooveSize.height)
                self.shapeLayer?.path = UIBezierPath(roundedRect: self.currentLineFrame, cornerRadius: 10).cgPath
            },
            completion: nil
        )
    }
    
    
    // FIXME: Top sheet allows to pan the map, it should not, also the panning of the topSheetView is not toggling up or down
    // DEBUG_TODO:  View Hierarchy shows a UIRoundedRectShadowView --> investigate further
    @objc private func didPanDrawer(_ gestureRecognizer: UIPanGestureRecognizer) {
        let velocity = gestureRecognizer.velocity(in: topSheetView)

        if gestureRecognizer.state == .ended {
            if velocity.y > 0 && viewModel.currentFrameIndex < 3 {
                viewModel.toggleDown()
            } else if velocity.y < 0 && viewModel.currentFrameIndex != 0 {
                viewModel.toggleUp()
            }
        }
        gestureRecognizer.setTranslation(CGPoint.zero, in: topSheetView)
    }
    private var aspectRatio: CGFloat {
        return UIScreen.main.bounds.width / UIScreen.main.bounds.height
    }

    func frame(for index: Int) -> CGRect {
       
        let visibleHeight: CGFloat = index == 0 ? Constants.minimumVisibleHeight : CGFloat(index) * Constants.visibleHeightIncrement

        return CGRect(
            x: 0.0,
            y: -(Constants.viewHeight - visibleHeight),
            width: Constants.viewWidth,
            height: Constants.viewHeight
        )
    }
}

private extension SearchVC {
    struct Constants {
        static let viewHeight: CGFloat = UIScreen.main.bounds.size.height - Constants.minimumVisibleHeight
        static let viewWidth: CGFloat = UIScreen.main.bounds.size.width
        static let minimumVisibleHeight: CGFloat = 110.0
        // 👆🏼_FIXME: Below this value && currentFrameIndex = 0 --> panGesture not recognized
        // defer_TODO: it may be because of the safeArea or something blocks the panning gesture to be recognized
        // * You need this to be resolved to enable the top sheet to seem like the third MockUp
        static let visibleHeightIncrement: CGFloat = (Constants.viewHeight - Constants.minimumVisibleHeight) / 4.0
        static let cornerRadius: CGFloat = 40.0
    }
}




