//
//  AutoSizeTableView.swift
//  reminders-app-mvvm
//
//  Created by Igor Cotrim on 25/10/24.
//

import UIKit

final class AutoSizeTableView: UITableView {
    
    // MARK: - Functions
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
}
