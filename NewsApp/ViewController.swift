//
//  ViewController.swift
//  NewsApp
//
//  Created by Нургазы on 19/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var articles = [Article]()
    var dataTask: URLSessionDataTask?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        let cell = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "NewsCell")
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        performSearch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNews" {
            let destination = segue.destination as! NewsController
            
            let indexpath = sender as! IndexPath
            print(indexpath)
            destination.newsURL = articles[indexpath.row].url
        }
    }
    
    
    func newsURL(searchText: String, category: Int) -> URL? {
        
        let categoryKind: String
        
        switch category {
        case 1: categoryKind = "health"
        case 2: categoryKind = "sport"
        case 3: categoryKind = "technology"
        case 4: categoryKind = "science"
        default: categoryKind = ""
        }
        
        
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urlString = "https://newsapi.org/v2/top-headlines?q=\(encodedText!)&category=\(categoryKind)&country=us&apiKey=f36e2c8e3e4f4ddfbcbd3fa10a28e6fc"
        
        return URL(string: urlString)
        
    }
    
    func parse(data: Data) -> [Article] {
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(NewsResult.self, from: data)
            return result.articles
        } catch {
            print("Parsing Error: \(error.localizedDescription)")
            return []
        }
        
    }
    
    func showNetworError() {
        let alert = UIAlertController(title: "ERROR", message: "There was an error accesing the NewsApi. Please try again.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func performSearch() {
        
        dataTask?.cancel()
        
        guard let url = newsURL(searchText: searchBar.text!, category: segmentedControl.selectedSegmentIndex) else {
            return
        }
        
        let session  = URLSession.shared
        
        dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if let error = error as NSError?, error.code == -999 {
                print("REQUEST CANCELED: \(error.localizedDescription)")
                return
            }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                
                DispatchQueue.main.async {
                    self.showNetworError()
                }
                
            }
            
            if let data = data {
                self.articles = self.parse(data: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
        dataTask?.resume()
        
    }

}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        performSearch()
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        .topAttached
    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.configureCell(for: articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showNews", sender: indexPath)
    }
}

/*
 f36e2c8e3e4f4ddfbcbd3fa10a28e6fc
 
 url = https://newsapi.org/v2/top-headlines?q=trump&apiKey=f36e2c8e3e4f4ddfbcbd3fa10a28e6fc
 
 */
