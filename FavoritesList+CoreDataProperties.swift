//
//  FavoritesList+CoreDataProperties.swift
//  BookingApp
//
//  Created by bloom on 8/8/24.
//
//

import Foundation
import CoreData


extension FavoritesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesList> {
        return NSFetchRequest<FavoritesList>(entityName: "FavoritesList")
    }

    @NSManaged public var authorName: String?
    @NSManaged public var bookName: String?
    @NSManaged public var bookPrice: Int32
    @NSManaged public var contents: NSObject?

}

extension FavoritesList : Identifiable {

}
