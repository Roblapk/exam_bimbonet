//
//  SpaceshipModel.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 21/12/23.
//

import Foundation

struct SpaceshipModel: Hashable, Codable{
    
    let flight_number: Int
    let mission_name: String
    let launch_date_utc: String
    let launch_site: LaunchSite
    let rocket: Rocket
    let links: Links
    let details: String?
    
}

struct LaunchSite: Hashable, Codable{
    let site_name: String
    let site_name_long: String
}

struct Rocket: Hashable, Codable{
    let rocket_id: String
    let rocket_name: String
    let rocket_type: String
}

struct Links: Hashable, Codable{
    let mission_patch_small: String?
    let article_link: String?
    let wikipedia: String?
    let video_link: String
    let youtube_id: String
    let flickr_images: [String]?
}
