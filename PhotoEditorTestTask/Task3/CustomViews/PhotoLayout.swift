//  Created by Kristina Grebneva on 25.08.2025.

import UIKit

protocol PhotoLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView,
                        layout: PhotoLayout,
                        aspectRatioForItemAt indexPath: IndexPath) -> CGFloat
}

final class PhotoLayout: UICollectionViewLayout {
    
    weak var delegate: PhotoLayoutDelegate?

    let numberOfColumns = 2
    let padding = DS.Padding.m
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
        guard let collectionView else { return 0 }
        let insets = collectionView.adjustedContentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView else { return }
        
        cache.removeAll(keepingCapacity: true)
        contentHeight = 0
        
        let columnWidth = (contentWidth - (CGFloat(numberOfColumns) - 1) * padding) / CGFloat(numberOfColumns)
        
        let xOffset = (0..<numberOfColumns).map {
            CGFloat($0) * (columnWidth + padding)
        }
        var yOffset = Array(repeating: CGFloat(0), count: numberOfColumns)
        
        for section in 0..<collectionView.numberOfSections {
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
                
                let column = yOffset.enumerated().min(by: { $0.element < $1.element })!.offset
                
                let aspect = delegate?.collectionView(collectionView, layout: self, aspectRatioForItemAt: indexPath) ?? 1
                                
                let height = max(1, columnWidth * aspect)
                
                let frame = CGRect(x: xOffset[column],
                                   y: yOffset[column],
                                   width: columnWidth,
                                   height: height)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                cache.append(attributes)
                
                yOffset[column] = frame.maxY + padding
                contentHeight = max(contentHeight, frame.maxY)
                
            }
        }
    }
    
    override var collectionViewContentSize: CGSize {
        CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        cache.filter( { $0.frame.intersects(rect) } )
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        cache.first { $0.indexPath == indexPath }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
            guard let cv = collectionView else { return false }
            return cv.bounds.width != newBounds.width
        }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        cache.removeAll()
        contentHeight = 0
    }
}

