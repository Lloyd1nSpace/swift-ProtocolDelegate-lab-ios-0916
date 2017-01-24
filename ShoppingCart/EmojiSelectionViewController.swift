//
//  EmojiSelectionViewController.swift
//  ShoppingCart
//
//  Created by Jim Campagno on 8/10/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class EmojiSelectionViewController: UIViewController {
    
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    
    var emojiDelegate: EmojiCreation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.22, green:0.33, blue:0.58, alpha:1.00)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard
            let leftText = leftTextField.text,
            let rightText = rightTextField.text else {
                print("There was an issue unwrapping the text in the text fields in Emoji Selection VC")
                return
        }
        emojiDelegate?.create(emojiGroup: (leftText, rightText))
        dismiss(animated: true, completion: nil)
    }
}
