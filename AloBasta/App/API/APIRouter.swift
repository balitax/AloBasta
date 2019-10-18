//
//  APIRouter.swift
//  ContactApp
//
//  Created by Agus Cahyono on 16/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Alamofire

enum APIRouter: APIConfiguration {
    case listImages(query: String)
    
    var baseURL: URL {
        switch self {
        case .listImages:
            guard let url = URL(string: EnvironmentURL.baseURL) else {
                fatalError("baseURL could not be configured.")
            }
            return url
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .listImages:
            return [
                HTTPHeaderField.contentType.rawValue: ContentType.form.rawValue,
                HTTPHeaderField.acceptType.rawValue: ContentType.json.rawValue
            ]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .listImages:
            return .get
        }
    }
    
    
    var path: String {
        switch self {
        case .listImages:
            return ""
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .listImages(let query):
            return [
                "key": "13976438-58ac63d70cf487051c7ebb3b5",
                "q": query,
                "image_type": "photo",
                "pretty": true,
            ]
        }
    }
    
    var multipartFormData: (MultipartFormData) -> Void {
        switch self {
        default:
            return { multipartFormData in
            }
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        headers?.forEach({ (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })
        return try parameterEncoding.encode(urlRequest, with: parameters)
    }
    
}
