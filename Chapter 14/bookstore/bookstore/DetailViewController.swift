//
//  DetailViewController.swift
//  BookStore
//
//  Created by Thorn on 3/6/19.
//  Copyright © 2019 Innovativeware. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var readSwitch: UISwitch!

    var delegate: BookStoreDelegate? = nil

    var myBook = Book()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail" {
            if let vc = segue.destination as? AddBookViewController {
                vc.delegate = delegate
                vc.editBook = true
                vc.book = myBook
            }
        }
    }

    func configureView() {
        if let detail = self.detailItem {
            myBook = detail
            titleLabel.text = myBook.title
            authorLabel.text = myBook.author
            descriptionTextView.text = myBook.description
            pagesLabel.text = String(myBook.pages)
            if myBook.readThisBook {
                readSwitch.isOn = true
            }
            else {
                readSwitch.isOn = false
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Book? {
        didSet {
            // Update the view.
            //configureView()
        }
    }

    @IBAction func deleteBookAction(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Warning",
                                                message: "Delete this book?",
                                                preferredStyle: .alert)

        let noAction = UIAlertAction(title: "No", style: .cancel) { (action) in
            print("Cancel")
        }
        alertController.addAction(noAction)

        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            self.delegate?.deleteBook(self)
        }
        alertController.addAction(yesAction)

        present(alertController, animated: false, completion: nil)
    }
}

