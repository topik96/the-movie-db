//
//  UITableView.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

extension UITableView {
  func reloadDataSmoothly() {
    UIView.setAnimationsEnabled(false)
    CATransaction.begin()

    CATransaction.setCompletionBlock { () -> Void in
      UIView.setAnimationsEnabled(true)
    }

    remembersLastFocusedIndexPath = true
    beginUpdates()
    reloadSections(NSIndexSet(index: 0) as IndexSet, with: .none)
    endUpdates()

    CATransaction.commit()
  }
}
