//
//  ViewController.swift
//  BooksEncyclopedia
//
//  Created by SOCS2 on 08/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrBooks: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let book1 = Book()
        book1.title = "Beginning iOS Application Deveopment"
        book1.author = "Greg Lim"
        book1.price = 50.99
        book1.thumbnail = "thumbnail1"
        
        let book2 = Book()
        book2.title = "Harry Potter"
        book2.author = "J.K. Rowling"
        book2.price = 40.51
        book2.thumbnail = "thumbnail2"
        
        arrBooks.append(book1)
        arrBooks.append(book2)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = arrBooks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
        cell?.textLabel?.text = book.title
        cell?.detailTextLabel?.text = book.author
        if let thumbnail = book.thumbnail {
            cell?.imageView?.image = UIImage(named: thumbnail)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = arrBooks[indexPath.row]
        
//        let info = "Title: \(book.title!), Author: \(book.author!), Price: \(book.price!)"
        
        let alertController = UIAlertController(title: "Book Information", message: "\(book)", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrBooks.remove(at: indexPath.row)
//            tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func showAddBook(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Book", message: "Input book title", preferredStyle: .alert
        )
        
        alertController.addTextField { txtTitle in
            
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let title = alertController.textFields![0].text!
            let book = Book()
            book.title = title
            book.author = ""
            book.price = 0.0
            
            let row = self.arrBooks.count
            self.arrBooks.append(book)
            
            let indexPath = IndexPath(row: row, section: 0)
            
            self.tableView.insertRows(at: [indexPath], with: .left)
        }
        
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

