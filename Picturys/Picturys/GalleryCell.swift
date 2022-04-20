//
//  GalleryCVCell.swift
//  Picturys
//
//  Created by Kenny Trang on 2/15/22.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var opacitySelectlayer: UIView!
    
    @IBOutlet weak var imageSelectIC: UIImageView!
    
    var currentMode = ""
    
        override var isHighlighted: Bool {
            didSet {
                if currentMode != "viewMode" {
                    opacitySelectlayer.isHidden = !isHighlighted
                }
            }
        }

        override var isSelected: Bool {
            didSet {
                if currentMode != "viewMode" {
                    opacitySelectlayer.isHidden = !isSelected
                    imageSelectIC.isHidden = !isSelected
                }
            }
        }
    

    @IBOutlet weak var showImage: UIImageView!
    
    
}
