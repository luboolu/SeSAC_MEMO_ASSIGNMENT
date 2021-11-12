//
//  MemoEditViewController.swift
//  SeSAC_MEMO
//
//  Created by 김진영 on 2021/11/11.
//

import UIKit
import RealmSwift

class MemoEditViewController: UIViewController {

    static let identifier = "MemoEditViewController"
    
    @IBOutlet weak var memoTextView: UITextView!
    
    var task: UserMemoList!
    
    let localRealm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "MemoOrange")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "MemoOrange")

        

        memoTextView.text = [task.title, task.content].joined(separator: "\n")
        memoTextView.font = UIFont().binggraeMedium
        // Do any additional setup after loading the view.
        
    }
    
    @objc func closeButtonClicked() {
        print(#function)
        //MemoListViewController로의 pop 화면전환
        self.navigationController?.popViewController( animated: true)
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
                
                //let task = UserMemoList(title: title, content: content, isFixed: false, date: Date())
                
                try! localRealm.write {
                    self.localRealm.create(UserMemoList.self, value: ["_id": self.task._id, "title": title, "content": content, "date": Date()], update: .modified)
                }
            }
            
            //MemoListViewController로의 pop 화면전환
            self.navigationController?.popViewController( animated: true)
        }
    }
    


}
