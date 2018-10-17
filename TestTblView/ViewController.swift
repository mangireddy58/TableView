//
//  ViewController.swift
//  TestTblView
//
//  Created by Sai Praveen Kumar on 17/10/18.
//  Copyright © 2018 Mangi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testTblView: UITableView!
    var collectionIndexPath: IndexPath?
    var  tableIndexPath: IndexPath?
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.timerFired(_:)), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionIndexPath = IndexPath(item: 0, section: 0) // initially set index path to 0,0
        tableIndexPath = IndexPath(row: 0, section: 0)
        let cell = testTblView.cellForRow(at: tableIndexPath!) as? CustomCell
        
        cell?.colletionViewOne.scrollToItem(at: IndexPath(item: collectionIndexPath!.row, section: 0), at: .left, animated: true)
    }
    
    
    @objc func timerFired(_ sender: UICollectionView?) {
        if collectionIndexPath!.row >= 10 - 1 {
            
            collectionIndexPath = IndexPath(item: 0, section: 0)
        }
        else {
            collectionIndexPath = IndexPath(item: collectionIndexPath!.row + 1, section: 0)
        }
        let cell = testTblView.cellForRow(at: tableIndexPath!) as! CustomCell
        cell.colletionViewOne.scrollToItem(at: IndexPath(item: (collectionIndexPath?.row)!, section: 0), at: .left, animated: true)
    }
}

extension UIViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 2;
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
            cell.colletionViewOne.tag = indexPath.section
            cell.colletionViewOne.reloadData()
            return cell
        }
        else {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            
            return cell
        }
        
    }
}

extension UIViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "ColletionCell"
        collectionView.register((UINib(nibName: "CollectionViewCell", bundle: nil)), forCellWithReuseIdentifier: identifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        cell.imgView.image = UIImage(named: "My_Pic.jpg")
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 200)
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 0 {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 10)
        }
    }

}
