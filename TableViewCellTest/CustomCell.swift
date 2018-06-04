
import UIKit

class CustomCell: UITableViewCell {
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = "RED LABEL"
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var blueLabel: UILabel = {
        let targetHeight: CGFloat = 100
        let label = UILabel()
        label.text = "BLUE LABEL"
        label.backgroundColor = .blue
        //Spring constraints for resizing while animations
        let weakConstraint = label.heightAnchor.constraint(equalToConstant: targetHeight)
        weakConstraint.priority = .defaultHigh
        weakConstraint.isActive = true
        label.heightAnchor.constraint(lessThanOrEqualToConstant: targetHeight).isActive = true
        return label
    }()

    override func setEditing(_ editing: Bool, animated: Bool) {
        self.blueLabel.isHidden = !editing
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        self.contentView.fillWith(view: self.stackView)
        self.stackView.addArrangedSubview(self.redLabel)
        self.stackView.addArrangedSubview(self.blueLabel)
        self.blueLabel.isHidden = true
    }
}
