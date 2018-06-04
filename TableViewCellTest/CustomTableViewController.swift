import UIKit

class CustomTableViewController: UITableViewController {
    
    //MARK: Actions
    
    @objc
    private func editButtonTap(_ sender: UIBarButtonItem) {
        self.tableView.setEditing(true, animated: true)
        self.navigationItem.rightBarButtonItem = self.doneButton
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.tableView.layoutIfNeeded()
    }
    
    @objc
    private func doneButtonTap(_ sender: UIBarButtonItem) {
        self.tableView.setEditing(false, animated: true)
        self.navigationItem.rightBarButtonItem = self.editButton
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.tableView.layoutIfNeeded()
    }
    
    //MARK: - Properties
    
    private lazy var editButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Edit",
                                     style: .plain,
                                     target: self,
                                     action: #selector(editButtonTap(_:)))
        button.tintColor = .white
        return button
    }()
    
    private lazy var doneButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Done",
                                     style: .done,
                                     target: self,
                                     action: #selector(doneButtonTap(_:)))
        button.tintColor = .white
        return button
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: NSStringFromClass(CustomCell.self))
        self.navigationItem.rightBarButtonItem = self.editButton
    }


    // MARK: - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 15
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustomCell.self), for: indexPath)
        cell.layoutIfNeeded()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}
