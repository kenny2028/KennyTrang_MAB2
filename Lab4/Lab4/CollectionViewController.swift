//
//  CollectionViewController.swift
//  Lab4
//
//  Created by Kenny Trang on 2/20/22.
//

import UIKit

private let reuseIdentifier = "pictureCell"

var allImages = [String]()


class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        
        //Importing images
        
        for i in 1...5 {
            allImages.append(String(i))
        }
        
        collectionView.collectionViewLayout = generateLayout()
        
    }

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: SEGUE
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showDetail" {
             if let source = segue.destination as? DetailController {
                 if let indexPath = collectionView.indexPath(for: (sender as? UICollectionViewCell)!) {
                     source.importname = allImages[indexPath.row]
                     
 //                    let alert = UIAlertController(title: "Entry Added", message: "Date:\(source.importingImage.date) Favorite: \(source.importingImage.favorited) Tags: \(source.importingImage.imagetags) \(source.importingImage.picture) ", preferredStyle: .alert)
 //
 //                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
 //                                self.present(alert, animated: true)
                 }
             }
             
         }
     }
    
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let image = UIImage(named: allImages[indexPath.row])
        cell.imageShow.image = image
    
        
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         
        //Header
         var supplementview = HCSView()
         if kind == UICollectionView.elementKindSectionHeader{
             supplementview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "pandaheader", for: indexPath) as! HCSView
 //
             supplementview.headerLabel.text = "Pandas -  "
         } else if kind == UICollectionView.elementKindSectionFooter {
             supplementview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "pandafooter", for: indexPath) as! HCSView
             
             supplementview.footerLabel.text = "Panda Images total - \(allImages.count)"
             
             
         }
         return supplementview
        
        //Footer

        
        
        
        
        
     }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func generateLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let photoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Photo Padding
        photoItem.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 2, bottom: 0, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: photoItem, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        section.boundarySupplementaryItems = [sectionHeader, sectionFooter]
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}
