//
//  ViewController.swift
//  DemoApi
//
//  Created by owner on 11/4/17.
//  Copyright © 2017 owner. All rights reserved.
//

import UIKit

class TableNumberViewController: UIViewController {
    
    var items = [TableNumber]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.append(TableNumber(1,"logo","Table1"))
        items.append(TableNumber(1,"logo","Table2"))
        items.append(TableNumber(1,"logo","Table3"))
        items.append(TableNumber(1,"logo","Table4"))
        items.append(TableNumber(1,"logo","Table5"))
        items.append(TableNumber(1,"logo","Table6"))
        items.append(TableNumber(1,"logo","Table7"))
        items.append(TableNumber(1,"logo","Table8"))
        items.append(TableNumber(1,"logo","Table9"))
        
      }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 }

extension TableNumberViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tableCell", for: indexPath) as! TableNumberCollectionViewCell
        let item = items[indexPath.row]
        cell.imageDisplay.image = UIImage(named: item.image)
        cell.tableNumberDisplay.text = item.tableNumber
        return cell
    }
    
    
}
