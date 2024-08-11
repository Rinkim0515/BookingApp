//
//  CoreDataService.swift
//  BookingApp
//
//  Created by bloom on 8/11/24.
//

import Foundation
import CoreData

class CoreDataService {
  static let shared: CoreDataService = .init()
  
  private(set) lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Books")
    container.loadPersistentStores { _, error in
      if let error {
        fatalError("Failed to load Persistent stores: \(error.localizedDescription)")
      }
    }
    return container
  }()
  
  private init() {}
  
  func saveBook(title: String,
                price: Int,
                authors: [String],
                isbn: String
  ) {
    guard !self.isDuplicate(isbn: isbn) else { return }
    let book = BookEntity(context: persistentContainer.viewContext)
    book.title = title
    book.price = Int32(price)
    book.authors = authors.joined(separator: ",")
    book.isbn = isbn
    book.createdDate = Date()
    do {
      try persistentContainer.viewContext.save()
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func fetchStoredBooks() -> [BookEntity] {
    let request = BookEntity.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(key: "createdDate", ascending: true)]
    do {
      return try persistentContainer.viewContext.fetch(request)
    } catch {
      print(error.localizedDescription)
    }
    return []
  }
  
  func isDuplicate(isbn: String) -> Bool {
    let request = BookEntity.fetchRequest()
    request.predicate = NSPredicate(format: "isbn ==%@", isbn)
    do {
      let result = try persistentContainer.viewContext.fetch(request)
      return !result.isEmpty
    } catch {
      print(error.localizedDescription)
    }
    return false
  }
  
  func deleteAllStoredBooks(){
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: BookEntity.fetchRequest())
    do {
      try persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: persistentContainer.viewContext)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  
}
