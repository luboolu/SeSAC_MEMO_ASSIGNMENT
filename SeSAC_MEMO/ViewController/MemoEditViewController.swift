//
//  MemoEditViewController.swift
//  SeSAC_MEMO
//
//  Created by 김진영 on 2021/11/11.
//

import UIKit

class MemoEditViewController: UIViewController {

    
    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        memoTextView.font = UIFont().binggraeMedium
        // Do any additional setup after loading the view.
    }
    


}
