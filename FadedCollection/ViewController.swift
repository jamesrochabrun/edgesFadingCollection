//
//  ViewController.swift
//  FadedCollection
//
//  Created by James Rochabrun on 10/10/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let src = SCR()
    var items: [UIImage] = [#imageLiteral(resourceName: "testPhoto.jpg") , #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"),  #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"),  #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"),  #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"),  #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg"), #imageLiteral(resourceName: "testPhoto.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(ImageCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageCell
        cell.photoView.image = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.tableView.fadeEdges(with: 2.0)
    }
}

class ImageCell: UITableViewCell {
    
    var photoView: UIImageView = {
        let i = UIImageView(frame: CGRect.zero)
        i.contentMode = .scaleToFill
        i.clipsToBounds = true
        return i
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoView.frame = self.bounds
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        self.contentView.addSubview(photoView)
    }
}

class SCR {
    
    func fadeHorizontalEdges(in collectionView: UICollectionView, modifier: CGFloat) {
        
        let visibleCells = collectionView.visibleCells
        
        guard !visibleCells.isEmpty else { return }
        
        let firstCell = visibleCells.first!
        
        let lastCell = visibleCells.last!
        
        visibleCells.forEach { $0.alpha = 1 }
        
        let cellWidth = firstCell.frame.width - 1 // 1 needs to change for the minimumline spacing
        
        let collectionViewLeftEdgePosition = collectionView.frame.origin.x
        
        let collectionViewRightEdgePosition = collectionView.frame.origin.x + collectionView.frame.size.width
        
        let indexPath = collectionView.indexPath(for: firstCell)!
        
        let theAttributes:UICollectionViewLayoutAttributes! = collectionView.layoutAttributesForItem(at: indexPath)
        
        let firstCellPositionInCollectionView: CGRect = collectionView.convert(theAttributes.frame, to: collectionView.superview)
        
        
        let indexPathLast = collectionView.indexPath(for: lastCell)!
        
        let theAttributeLast: UICollectionViewLayoutAttributes! = collectionView.layoutAttributesForItem(at: indexPathLast)
        
        let lastCellPositionInCollectionView: CGRect = collectionView.convert(theAttributeLast.frame, to: collectionView.superview)
        
        
        let firstCellPosition: CGFloat = collectionView.convert(firstCellPositionInCollectionView, to: collectionView.superview).origin.x
        
        let lastCellPosition: CGFloat = collectionView.convert(lastCellPositionInCollectionView, to: collectionView.superview).origin.x + cellWidth
        
        
        let firstCellOpacity = 1.0 - (((collectionViewLeftEdgePosition - firstCellPosition) / cellWidth) * modifier)
        
        let lastCellOpacity = 1.0 - (((lastCellPosition - collectionViewRightEdgePosition) / cellWidth) * modifier)
        
        firstCell.contentView.alpha = firstCellOpacity
        
        lastCell.contentView.alpha = lastCellOpacity
        
    }
    
}

protocol CollectionFadable {}
extension UITableView: CollectionFadable {}

extension CollectionFadable where Self: UITableView {
    
    func fadeEdges(with modifier: CGFloat) {
        
        let visibleCells = self.visibleCells
        
        guard !visibleCells.isEmpty else { return }
        
        guard let topCell = visibleCells.first else { return }
        
        guard let bottomCell = visibleCells.last else { return }
        
        visibleCells.forEach { $0.contentView.alpha = 1 }
        
        let cellHeight = topCell.frame.height - 1 // 1 needs to change for the minimumline spacing\
        
        let tableViewTopPosition = self.frame.origin.y
        
        let tableViewBottomPosition = self.frame.maxY//.origin.y + self.frame.size.height ///her e can be maxy
        
        guard let topCellIndexpath = self.indexPath(for: topCell) else { return }
        
        let topCellPositionInTableView = self.rectForRow(at:topCellIndexpath)
        
        guard let bottomCellIndexpath = self.indexPath(for: bottomCell) else { return }
        
        let bottomCellPositionInTableView = self.rectForRow(at: bottomCellIndexpath)
        
        let topCellPosition = self.convert(topCellPositionInTableView, to: self.superview).origin.y
        
        let bottomCellPosition = self.convert(bottomCellPositionInTableView, to: self.superview).origin.y + cellHeight
        
        let topCellOpacity = (1.0 - ((tableViewTopPosition - topCellPosition) / cellHeight) * modifier)
        
        let bottomCellOpacity = (1.0 - ((bottomCellPosition - tableViewBottomPosition) / cellHeight) * modifier)
        
        topCell.contentView.alpha = topCellOpacity
        
        bottomCell.contentView.alpha = bottomCellOpacity
    }
}



