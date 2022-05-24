//
//  Photos.swift
//  Navigation
//
//  Created by Iurasova Katya on 23.05.2022.
//

import UIKit

struct PhotosModel {
    var image: String
    
    static func makeMockModel() -> [PhotosModel] {
        
        var model = [PhotosModel]()
        
        model.append(PhotosModel(image: "norwich1"))
        model.append(PhotosModel(image: "norwich2"))
        model.append(PhotosModel(image: "norwich3"))
        model.append(PhotosModel(image: "norwich4"))
        model.append(PhotosModel(image: "norwich5"))
        model.append(PhotosModel(image: "norwich6"))
        model.append(PhotosModel(image: "norwich7"))
        model.append(PhotosModel(image: "norwich8"))
        model.append(PhotosModel(image: "norwich9"))
        model.append(PhotosModel(image: "norwich10"))
        model.append(PhotosModel(image: "norwich11"))
        model.append(PhotosModel(image: "norwich12"))
        model.append(PhotosModel(image: "norwich13"))
        model.append(PhotosModel(image: "norwich14"))
        model.append(PhotosModel(image: "norwich15"))
        model.append(PhotosModel(image: "norwich16"))
        model.append(PhotosModel(image: "norwich17"))
        model.append(PhotosModel(image: "norwich18"))
        model.append(PhotosModel(image: "norwich19"))
        model.append(PhotosModel(image: "norwich20"))
   return model
    }
}
