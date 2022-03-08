//
//  recipiedataHandelr.swift
//  recipes
//
//  Created by Kenny Trang on 3/8/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class recipeDataHandler {
    
    let db = Firestore.firestore() // Create a reference to firestore (determines which database by p.list information)
    
    var recipeData = [Recipe]()
    
    func getFirebaseData() async { //async because going over network -
        do {
            let snapshot = try await db.collection("recipes").getDocuments() // Returns all items in the collection
            // Type being returned is query snapshot - firebase snapshot - You can access like an array but not fully
            self.recipeData = snapshot.documents.compactMap {document->Recipe? in
                return try? document.data(as: Recipe.self) //Unparse query snapshot into our data model // compactMap goes through each item like a forloop-> returns a instance of recipe for each document data(as:__ ) and will map every document to that struct and return // HAS TO MATCH STRUCTURE
            }
            print(self.recipeData)
        }
        catch{
            print("Error fetching document: \(error.localizedDescription)")
        }
    }
                                
    func getRecipes()->[Recipe]{
        return recipeData
    }
    
    func addRecipe(name:String, url:String){
        let recipeCollection = db.collection("recipes")
        
        //create Dictionary
        let newRecipeDict = ["name": name, "url": url]
        
        // Add a new document with a generated id
        var ref: DocumentReference? = nil
        ref = recipeCollection.addDocument(data: newRecipeDict)
        {err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

    func deleteRecipe(recipeID: String){
        // Delete the object from Firestore
        db.collection("recipes").document(recipeID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    
    
}
