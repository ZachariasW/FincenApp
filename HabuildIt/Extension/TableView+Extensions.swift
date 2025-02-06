//
//  TableView+Extensions.swift
//  WYB
//
//  Created by Mobilecoderz5 on 28/03/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func indexPathForView(_ view: UIView) -> IndexPath? {
         let center = view.center
         let viewCenter = convert(center, from: view.superview)
         let indexPath = indexPathForRow(at: viewCenter)
         return indexPath
     }
}
