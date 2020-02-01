//
//  ArticleDetailsView.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/30.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import UIKit

public class ArticleDetailsView: UIViewController {
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var readMoreButton: UIButton!
    
    let imageWidthInPixels: CGFloat = 400.0
    
    var article: Article?
    
    @IBAction func readMoreButtonTapped(_ sender: Any) {
           if let articleUrl = article!.url {
               UIApplication.shared.open(URL(string: articleUrl)!)
           }
       }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if let resource = article!.urlToImage {
            articleImage!.kf.setImage(with: URL(string: resource), placeholder: UIImage(named: "widePlaceholder")) { result in
                    switch result {
                    case .success(let value):
                        self.articleImage!.image = self.resizeImage(image: value.image)
                    case .failure(let error):
                        print("Error loading image: \(error)")
                    }
                }
            } else {
                articleImage!.image = UIImage(named: "widePlaceholder")
            }
        articleTitle!.text = article!.title
        articleDescription!.text = article!.content ?? article!.description
        if article!.url == nil {
            readMoreButton.isHidden = true
        }
    }
    
    func resizeImage(image: UIImage) -> UIImage {
        let scale = imageWidthInPixels / image.size.width
        var imageHeightInPixels = image.size.height * scale
        if imageHeightInPixels > 450 {
            imageHeightInPixels = 450
        }
        UIGraphicsBeginImageContext(CGSize(width: imageWidthInPixels, height: imageHeightInPixels))
        image.draw(in: CGRect(x: 0, y: 0, width: imageWidthInPixels, height: imageHeightInPixels))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
