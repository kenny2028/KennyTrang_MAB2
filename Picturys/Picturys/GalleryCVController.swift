//
//  GalleryCVController.swift
//  Picturys
//
//  Created by Kenny Trang on 2/15/22.
//

import UIKit

private let reuseIdentifier = "pictureCell"

class GalleryCVController: UICollectionViewController {
    
    var pictureDataRunner = pictureDataHandler()
    var allImageData = [pictureData]()
    
    var selectedItems : [IndexPath: Bool] = [:]
    //let imagetest = UIImage(named: "mtn.jpg")
    
    
    enum Modes {
        case view
        case select
    }
 
    var currentMode: Modes = .view {
        didSet {
            switch currentMode {
            case .view:
                selectBarButton.title = "Select"
                navigationItem.leftBarButtonItem = nil
                collectionView.allowsMultipleSelection = false
            case .select:
                selectBarButton.title = "Cancel"
                navigationItem.leftBarButtonItem = deleteBarButton
                collectionView.allowsMultipleSelection = true
            }
        }
    }
    

    
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
        currentMode = .view
        
        
        //Setup barbutton into navigation bar
        barbuttonSetup()
        
        //setup database
        pictureDataRunner.realmSetup()
        
        //return all images into the array
        allImageData = pictureDataRunner.getAllImages()
        
        
        print("Check if there in \(allImageData.isEmpty)")
    
        
    }
    
    
    
    //MARK: SEGUE
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue) {
        if segue.identifier == "UploadSegue" {
            if let source = segue.source as? UploadViewController {
                if source.sendingImage.picturedata != nil {

                    var newitem = pictureData()
                    newitem = source.sendingImage

                    self.pictureDataRunner.addItem(newItem: newitem)

                    //allImageData.append(source.sendingImage)

                    print(source.sendingImage)
                    render()

                }
            }
        }
    }
    

    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let source = segue.destination as? DetailViewController {
                if let indexPath = collectionView.indexPath(for: (sender as? UICollectionViewCell)!) {
                    source.importingImage = allImageData[indexPath.row]
                }
            }
            
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "detailSegue" {
            if currentMode == .view {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    

    
    func render() {
        allImageData = pictureDataRunner.getAllImages()
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
        print(allImageData.count)
        return allImageData.count

    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GalleryCell
        //configure the cell
        
        if currentMode == .select {
            cell.currentMode = "selectMode"
            print("selectMode")
        } else {
            cell.currentMode = "viewMode"
            print("currentMode")
        }
            
            
        let image = UIImage(data: allImageData[indexPath.row].picturedata!)
        cell.showImage.image = image
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch currentMode {
        case .view:
            break
        case .select:
            selectedItems[indexPath] = true
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if currentMode == .select {
            selectedItems[indexPath] = false
        }
    }

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header = CollectionRV()
        if kind == UICollectionView.elementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photoheader", for: indexPath) as! CollectionRV
//            header.headerlabel.text = allImageData[indexPath.row].month
            //header.headerlabel.text = "Feburary"
            
            if allImageData.isEmpty == false {
            header.headerlabel.text = allImageData[indexPath.row].date
                //Get Date From first object and create a section header
                let grabdate = allImageData[indexPath.row].datetag
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM yyyy"
                
                
                header.headerlabel.text = "\(formatter.string(from: grabdate!))"
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
        
        let sortedArray = allImageData.sorted {$0.datetag! > $1.datetag!}
        
        allImageData = sortedArray
        
    }
    
    
    
    
    //MARK: UIButton Functions
    
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(didSelectButtonClicked(_:)))
        return barButtonItem
    }()
    
    lazy var deleteBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didDeleteButtonClicked(_:)))
        return barButtonItem
    }()
    
    //ButtonClicked
    
    @objc func didSelectButtonClicked(_ sender: UIBarButtonItem) {
       // currentMode = currentMode == .view ? .select : .view
        if currentMode == .view {
            currentMode = .select
        } else {
            currentMode = .view
        }
        collectionView.reloadData()
    }
    
    @objc func didDeleteButtonClicked(_ sender: UIBarButtonItem) {
        var deleteItems: [IndexPath] = []
        for (key, value) in selectedItems {
            if value {
                deleteItems.append(key)
            }
        }
        
        for i in deleteItems.sorted(by: {$0.item > $1.item}) {
            //Delete from realm
            pictureDataRunner.deleteItem(Item: allImageData[i.item])
            
            //Delete from array first than delete from realm
            allImageData.remove(at: i.item)
            
            collectionView.deleteItems(at: deleteItems)
            
            //reset dictionary
            deleteItems.removeAll()
            
        
            
        }
        
    }
    
    //Setup barbuttonitems into layout
    
    private func barbuttonSetup() {
        navigationItem.rightBarButtonItem = selectBarButton
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
