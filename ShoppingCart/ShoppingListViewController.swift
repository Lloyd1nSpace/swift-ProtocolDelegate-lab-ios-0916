//
//  ShoppingListViewController.swift
//  ShoppingCart
//
//  Created by Jim Campagno on 8/10/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

// MARK: Emoji protocol
protocol EmojiCreation {
    func create(emojiGroup: (String, String))
}

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var emojis: [(String, String)] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCustomizations()
    }
    
    func viewCustomizations() {
        view.backgroundColor = Constants.viewBackgroundColor
        tableView.backgroundColor = Constants.listBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.identifier == Constants.segueID ? segue.destination as? EmojiSelectionViewController : nil
        dest?.emojiDelegate = self
    }
    
}

// MARK: - UITableViewDataSource Methods
extension ShoppingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! EmojiCellTableViewCell
        cell.firstEmojiLabel.text = emojis[indexPath.row].0
        cell.secondEmojiLabel.text = emojis[indexPath.row].1
        cell.backgroundColor = Constants.listBackgroundColor
        return cell
    }
}

// MARK: - UITableViewDelegate Methods
extension ShoppingViewController: UITableViewDelegate { }

// MARK: - Protocol Extension
extension ShoppingViewController: EmojiCreation {
    func create(emojiGroup: (String, String)) {
        emojis.append(emojiGroup)
    }
}


