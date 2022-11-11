//
//  ViewController.swift
//  BooksEncyclopedia
//
//  Created by SOCS2 on 08/11/21.
//

import UIKit

class ViewControllerSections: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrCategories: [BookCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let book1 = Book()
        book1.title = "Beginning iOS Application Deveopment"
        book1.author = "Greg Lim"
        book1.price = 50.99
        book1.thumbnail = "thumbnail1"
        
        let book1_2 = Book()
        book1_2.title = "Mastering Swift"
        book1_2.author = "Karen S"
        book1_2.price = 50.99
        book1_2.thumbnail = "thumbnail1"
        
        let category1 = BookCategory()
        category1.category = "Programming"
        category1.books.append(book1)
        category1.books.append(book1_2)
        
        let book2 = Book()
        book2.title = "Harry Potter"
        book2.author = "J.K. Rowling"
        book2.price = 40.51
        book2.thumbnail = "thumbnail2"
        
        let book2_2 = Book()
        book2_2.title = "Dora the explorer"
        book2_2.author = "Bikinan Sam"
        book2_2.price = 40.51
        book2_2.thumbnail = "thumbnail2"
        
        let category2 = BookCategory()
        category2.category = "Novel"
        category2.books.append(book2)
        category2.books.append(book2_2)
        
        arrCategories.append(category1)
        arrCategories.append(category2)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCategories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrCategories[section].category
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCategories[section].books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = arrCategories[indexPath.section]
        let book = category.books[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
        cell?.textLabel?.text = book.title
        cell?.detailTextLabel?.text = book.author
        if let thumbnail = book.thumbnail {
            cell?.imageView?.image = UIImage(named: thumbnail)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = arrCategories[indexPath.section].books[indexPath.row]
        
        let alertController = UIAlertController(title: "Book Information", message: "\(book)", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
}

