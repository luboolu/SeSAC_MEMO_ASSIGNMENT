//
//  MemoSearchViewController.swift
//  SeSAC_MEMO
//
//  Created by 김진영 on 2021/11/11.
//

import UIKit
import RealmSwift

class MemoSearchViewController: UIViewController {
    
    static let identifier = "MemoSearchViewController"

    @IBOutlet weak var tableView: UITableView!
    
    let localRealm = try! Realm()
    
    var tasks: Results<UserMemoList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView NIB 등록
        tableView.register(UINib(nibName: "MemoTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MemoTableViewHeader")
        
        tasks = localRealm.objects(UserMemoList.self).sorted(byKeyPath: "date", ascending: false)
        
        //navigationItem.title = "Search"
        //navigationItem.searchController?.delegate = self
        
        // Do any additional setup after loading the view.
    }
}

extension MemoSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MemoTableViewHeader.identifier) as? MemoTableViewHeader else {
            return UITableViewHeaderFooterView()
        }
        
        header.headerLabel.text = "\(tasks.count)개 찾음"
        header.headerLabel.font = UIFont().binggraeBold
        header.headerLabel.textColor = .black
        
        return header

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title.text = "서치뷰컨트롤러"
        
        return cell
        
    }
    
    
}

extension MemoSearchViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
    
    
    
}



