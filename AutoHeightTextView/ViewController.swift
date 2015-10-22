//
//  ViewController.swift
//  AutoHeightTextView
//
//  Created by ノーランワーナー on 2015/10/21.
//  Copyright © 2015年 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    let verticalInset = 16.0
    let horizontalInset = 10.0
    let backgroundColor = UIColor(white: 0.97, alpha: 1.0)
    let animationDuration = 0.2
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.textAlignment = .Left
        textView.showsVerticalScrollIndicator = false
        textView.backgroundColor = backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let oldString: NSString = textView.text
        let newString: NSString = oldString.stringByReplacingCharactersInRange(range, withString: text)
        let size = CGSizeMake(textView.frame.size.width - CGFloat(horizontalInset), CGFloat(MAXFLOAT))
        let rect = newString.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: textView.font!], context: nil)
        textViewHeightConstraint.constant = rect.height + CGFloat(verticalInset)
        UIView.animateWithDuration(animationDuration, animations: { [weak self] in
            self?.view.layoutIfNeeded()
        })
        return true
    }

}

