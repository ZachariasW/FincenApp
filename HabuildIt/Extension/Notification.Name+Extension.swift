//
//  Notification.Name+Extension.swift
//  WeekInChina
//
//  Created by Vikas Sachan on 18/04/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//

import Foundation
extension Notification.Name {
    static let fontChanged = Notification.Name("fontChanged")
    static let bookmarkStatusChangedInBookmarkScreen = Notification.Name("bookmarkStatusChangedInBookmarkScreen")
    static let bookmarkStatusChangedInPreviousScreen = Notification.Name("bookmarkStatusChangedInPreviousScreen")
    static let bookmarkStatusChangedInLatestScreen = Notification.Name("bookmarkStatusChangedInLatestScreen")
    static let bookmarkStatusChangedInCategoryScreen = Notification.Name("bookmarkStatusChangedInCategoryScreen")
    static let reloadBookmark = Notification.Name("reloadBookmark")
    static let setCenter = Notification.Name("setCenter")
    static let pageLoaded = Notification.Name("pageLoaded")
    static let statusChanged = Notification.Name("statusChanged")
}
