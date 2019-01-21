//
//  Endpoints.swift
//  CogniChallenge
//
//  Created by Felix Changoo on 1/19/19.
//  Copyright © 2019 Felix Changoo. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://cashback-explorer-api.herokuapp.com"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum SignIn: Endpoint {
        case users
        
        public var path: String {
            switch self {
                case .users: return "/users"
            }
        }
        
        public var url: String {
            switch self {
                case .users: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
    enum Venues: Endpoint {
        case get
        
        public var path: String {
            switch self {
                case .get: return "/venues"
            }
        }
        
        public var url: String {
            switch self {
                case .get: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
