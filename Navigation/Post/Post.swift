//
//  Post.swift
//  Navigation
//
//  Created by Iurasova Katya on 22.05.2022.
//


import UIKit

struct PostModel {
    var author: String
    var description: String?
    var image: String
    var likes: Int
    var views: Int
    
    static func makeMockModel() -> [PostModel] {
        var modelPost = [PostModel]()
        
        modelPost.append(PostModel(author: "Cобачник", description: "Готовимся к лету! Сходили на тримминг!", image: "trimming", likes: 15, views: 180))
        
        modelPost.append(PostModel(author: "Собаковод", description: "Я тут еще совсем маленький)", image: "puppy", likes: 7, views: 210))
        
        modelPost.append(PostModel(author: "Любитель собак", description: "Сегодня мы посетили выставку.", image: "pokaz", likes: 19, views: 345))
        
        modelPost.append(PostModel(author: "Терьер", description: "Любимое время дня - прогулка", image: "walk", likes: 9, views: 150))
        
        modelPost.append(PostModel(author: "Пушистик", description: "Мои друзья", image: "friends", likes: 24, views: 641))
        
        return modelPost
    }
}
