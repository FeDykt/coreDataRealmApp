//
//  RealmViewController.swift
//  coreDataRealmApp
//
//  Created by fedot on 06.01.2022.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {
    let tableView = UITableView()
    var tableViewCellArray: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       

        tableView.frame = view.frame
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Realm"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addNewCell))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .done, target: self, action: #selector(reloadData))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func reloadData() {
        
    }
    

    @objc func addNewCell() {
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
        var textField = UITextField()
        
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            if !textField.text!.isEmpty {
                self.tableViewCellArray.append(textField.text!)
            } else {
                self.showAlert(title: "You have not entered any text")
            }
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    
        
        alertController.addTextField { textFieldtext in
            textFieldtext.placeholder = "New task"
            textField = textFieldtext
        }
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title: String) {
        let alert = UIAlertController(title: "Error", message: title, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    
}

extension RealmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = tableViewCellArray[indexPath.row]
        cell.textLabel?.text = task
        return cell
    }
    
    
}
