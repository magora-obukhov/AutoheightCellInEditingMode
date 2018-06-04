
import UIKit

class CustomCell: UITableViewCell {
    var heightConstraint: NSLayoutConstraint?
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = "RED LABEL"
        label.backgroundColor = .red
        return label
    }()
    
    private lazy var blueLabel: UILabel = {

        let label = UILabel()
        label.text = "BLUE LABEL"
        label.backgroundColor = .blue

        return label
    }()

    override func setEditing(_ editing: Bool, animated: Bool) {
        self.blueLabel.isHidden = !editing
        if editing {
            self.heightConstraint?.constant = 400
        } else {
            self.heightConstraint?.constant = 100
        }
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
        self.heightConstraint = self.contentView.heightAnchor.constraint(equalToConstant: 100)
        self.heightConstraint?.isActive = true
        self.contentView.fillWith(view: self.stackView)
        self.stackView.addArrangedSubview(self.redLabel)
        self.stackView.addArrangedSubview(self.blueLabel)
        self.blueLabel.isHidden = true
    }
}
