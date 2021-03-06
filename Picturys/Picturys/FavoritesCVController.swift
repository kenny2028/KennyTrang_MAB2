//
//  GalleryCVController.swift
//  Picturys
//
//  Created by Kenny Trang on 2/15/22.
//

import UIKit

private let reuseIdentifier = "favoriteCell"

class FavoritesCVController: UICollectionViewController{

    
    var pictureDataRunner = pictureDataHandler()
    var allImageData = [pictureData]()
    var favoritesImageData = [pictureData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //TESTING ADDING ONE IMAGE
//        let image1 = pictureData(picture: UIImage(named: "mtn.jpg")!, imagetags: "sdd", favorited: false, date: "dd", month: "ddd")
//
//        for i in 1...10 {
//            allImageData.append(image1)
//        }
        
        
        
        collectionView.collectionViewLayout = generateLayout()
        
        //pictureDataRunner.realmSetup()
        
        //collectionView.reloadData(
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(GalleryCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        //ON RELOAD SET current mode to non-select
        
        //setup database
        pictureDataRunner.realmSetup()
        
        filter()
        
        if (favoritesImageData.isEmpty == true) {
            let alert = UIAlertController(title: "No Favorited Images Found", message: "Please favorite an image", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
        
        print("Check if there in \(allImageData.isEmpty)")
        
        render()
        
    }
    
   
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue2" {
            if let source = segue.destination as? DetailViewController {
                if let indexPath = collectionView.indexPath(for: (sender as? UICollectionViewCell)!) {
                    source.importingImage = favoritesImageData[indexPath.row]
                }
            }
            
        }
    }
    
    func filter() {
        
        allImageData = pictureDataRunner.getAllImages()
        favoritesImageData.removeAll()
        
        for item in allImageData {
            
            if (item.favorited == true) {
                //Grab Favorited Items
                favoritesImageData.append(item)
            }
            
        }
        
    }

    
    func render() {
        
        filter()
        
        
        collectionView.reloadData()
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        //print(favoritesImageData.count)
        return favoritesImageData.count

    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoritesCell
        //configure the cell
        

        
        let image = UIImage(data: favoritesImageData[indexPath.row].picturedata!)
        cell.showImageFav.image = image     
        return cell
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header = CollectionRV()
    
        
        
        if kind == UICollectionView.elementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "favoriteheader", for: indexPath) as! CollectionRV
//            header.headerlabel.text = allImageData[indexPath.row].month
            //header.headerlabel.text = "Feburary"
        
            
            if favoritesImageData.isEmpty == false {
                header.favoritesHeaderlabel.text = favoritesImageData[indexPath.row].date
                //Get Date From first object and create a section header
                let grabdate = favoritesImageData[indexPath.row].datetag
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM yyyy"
                
                header.favoritesHeaderlabel.text = "\(formatter.string(from: grabdate!))"
            } else {
                header.favoritesHeaderlabel.text =  ""
            }
            
            
            
        }
        
        
        
        return header
    }
    
   
    
    
    
    
    //MARK: CollectionView Layout
    
    func generateLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let photoItem = NSCollectionLayoutItem(layoutSize: itemSize)
        photoItem.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 2, bottom: 0, trailing: 2)
        let groupsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, subitem: photoItem, count: 4)
        let section = NSCollectionLayoutSection(group: group)
        //Header
        let headersize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headersize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]
        
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
 
        
        return layout
    }
    

    

    
    func filterPhotos() {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd+HH:mm"
        
        let sortedArray = favoritesImageData.sorted {$0.datetag! > $1.datetag!}
        
        allImageData = sortedArray
        
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

}

