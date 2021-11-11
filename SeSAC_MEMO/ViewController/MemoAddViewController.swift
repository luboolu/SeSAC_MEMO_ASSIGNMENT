//
//  MemoAddViewController.swift
//  SeSAC_MEMO
//
//  Created by 김진영 on 2021/11/09.
//

import UIKit
import RealmSwift

class MemoAddViewController: UIViewController {
    
    let localRealm = try! Realm()
    
    
    @IBOutlet weak var memoTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "MemoOrange")


        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "MemoOrange")
        
        self.memoTextView.font = UIFont().binggraeMedium
        self.memoTextView.textColor = .white
        


    }
    
    @objc func closeButtonClicked() {
        print(#function)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonClicked() {
        print(#function)
        
        if let text = memoTextView.text {
            //print(text.split(separator: "\n").first)
            var memo = text.split(separator: "\n")
            
            if memo.count > 0 {

                let title = String(memo.first!)
                memo.remove(at: 0)
                let content = memo.joined(separator: "\n")
                
                let task = UserMemoList(title: title, content: content, isFixed: false, date: Date())
                
                try! localRealm.write {
                    localRealm.add(task)
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
    }

    
    

    
    


}
