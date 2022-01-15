//
//  autoSizeTableView.swift
//  iosProjectAugusto
//
//  Created by COTEMIG on 03/12/21.
//

import UIKit

class autoSizeTableView: UITableView {

    override public var contentSize: CGSize{
        didSet{
            invalidateIntrinsicContentSize()
        }
    }
    
    override public func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.setNeedsLayout()
    }
    
    override public var intrinsicContentSize: CGSize{
        setNeedsLayout()
        
        return CGSize(width: contentSize.width, height: contentSize.height + contentInset.top   + contentInset.bottom)
    }

}
