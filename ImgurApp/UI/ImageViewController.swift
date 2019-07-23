//
//  ImageViewController.swift
//  ImgurApp
//
//  Created by Jake Elrod on 7/22/19.
//  Copyright © 2019 Stephen Elrod. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var image: Image? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = self.image {
            self.imageView.pin_setImage(from: image.url)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedImageView(_ sender: Any) {
        if self.closeButton.isHidden {
            self.closeButton.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1.0
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.closeButton.alpha = 0.0
            }) { (finished) in
                if finished {
                    self.closeButton.isHidden = true
                }
            }
        }
    }
    
    @IBAction func doubleTapImageView(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            if self.scrollView.zoomScale == self.scrollView.minimumZoomScale {
                self.scrollView.zoomScale = self.scrollView.maximumZoomScale
            } else {
                self.scrollView.zoomScale = self.scrollView.minimumZoomScale
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
