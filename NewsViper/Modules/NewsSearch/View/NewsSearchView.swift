//
//  NewsSearchView.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

protocol NewsSearchViewProtocol: class {
    var presenter: NewsSearchPresenterProtocol? { get set }
    
    func showArticles(articles: [Article])
    
    func showError()
}

class NewsSearchView: UIViewController {
    var presenter: NewsSearchPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    private let imageDimensionInPixels: CGFloat = 84
    private var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
}

extension NewsSearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keywords = searchBar.text, !keywords.isEmpty {
            loadingIndicator.startAnimating()
            presenter?.searchByKeywords(keywords: keywords)
        }
    }
}

extension NewsSearchView: NewsSearchViewProtocol {
    func showArticles(articles: [Article]) {
        self.articles = articles
        loadingIndicator.stopAnimating()
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem with searching news", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        loadingIndicator.stopAnimating()
    }
}

extension NewsSearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = articles?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        let title = item.title
        let titleAttribs = [ NSAttributedString.Key.foregroundColor: UIColor.black,
                             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16) ]
        let titleString = NSMutableAttributedString(string: title!, attributes: titleAttribs)
        
        cell.articleTitle.attributedText = titleString
        
        if let resource = item.urlToImage {
            cell.articleImage.kf.setImage(with: URL(string: resource), placeholder: UIImage(named: "placeholder")) { result in
                switch result {
                case .success(let value):
                    cell.articleImage.image = self.resizeImage(image: value.image)
                case .failure(let error):
                    print("Error loading image: \(error)")
                }
            }
        } else {
            cell.articleImage.image = UIImage(named: "placeholder")
        }
        
        cell.article = item
        
        return cell
    }
    
    func resizeImage(image: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: imageDimensionInPixels, height: imageDimensionInPixels))
        image.draw(in: CGRect(x: 0, y: 0, width: imageDimensionInPixels, height: imageDimensionInPixels))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ArticleCell
        presenter?.showArticleDetails(article: cell.article!)
    }
}
