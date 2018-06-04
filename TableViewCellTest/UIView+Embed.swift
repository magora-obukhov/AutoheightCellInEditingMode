import UIKit


extension UIView {

	func removeSubviews() {
		let subviews = self.subviews
		for subview in subviews {
			subview.removeFromSuperview()
		}
	}

    func fillWith(view: UIView) {
        self.fillWith(view: view, insets: UIEdgeInsets.zero)
    }

    func fillWith(view: UIView, pinning: [UIRectEdge]) {
        view.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(view)

		if (pinning.contains(.top)) {
        	let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
				toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
			self.addConstraint(pinTop)
		}
		
		if (pinning.contains(.bottom)) {
			let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
				toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
			self.addConstraint(pinBottom)
		}
		
		if (pinning.contains(.left)) {
			let pinLeading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal,
				toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
			self.addConstraint(pinLeading)
		}
		
		if (pinning.contains(.right)) {
        	let pinTrailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal,
				toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
			self.addConstraint(pinTrailing)
		}
    }

    func fillWith(view: UIView, insets: UIEdgeInsets, pinning: [UIRectEdge]) {
        view.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(view)

		if (pinning.contains(.top)) {
        	let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
				toItem: self, attribute: .top, multiplier: 1.0, constant: insets.top)
			self.addConstraint(pinTop)
		}
		
		if (pinning.contains(.bottom)) {
        	let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
				toItem: self, attribute: .bottom, multiplier: 1.0, constant: insets.bottom)
			self.addConstraint(pinBottom)
		}
		
		if (pinning.contains(.left)) {
	        let pinLeading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal,
				toItem: self, attribute: .leading, multiplier: 1.0, constant: insets.left)
			self.addConstraint(pinLeading)
		}
		
		if (pinning.contains(.right)) {
        	let pinTrailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal,
				toItem: self, attribute: .trailing, multiplier: 1.0, constant: insets.right)
			self.addConstraint(pinTrailing)
		}
    }
	
    func fillWith(view: UIView, insets: UIEdgeInsets) {
        view.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(view)

        let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
			toItem: self, attribute: .top, multiplier: 1.0, constant: insets.top)
		
        let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
			toItem: self, attribute: .bottom, multiplier: 1.0, constant: insets.bottom)
		
        let pinLeading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal,
			toItem: self, attribute: .leading, multiplier: 1.0, constant: insets.left)
		
        let pinTrailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal,
			toItem: self, attribute: .trailing, multiplier: 1.0, constant: insets.right)
		
        self.addConstraints([pinTop, pinBottom, pinLeading, pinTrailing])
    }

	func fixSize(width: CGFloat? = nil, height: CGFloat? = nil) {
		if let width = width {
        	let fixWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal,
				toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width)
        	self.addConstraint(fixWidth)
    	}

		if let height = height {
        	let fixHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal,
				toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
        	self.addConstraint(fixHeight)
    	}
	}
}
