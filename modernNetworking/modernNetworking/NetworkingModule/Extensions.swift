

import Foundation
extension URL {
    init(baseUrl: String, path: String, params: JSON, method: HTTPMethod) {
        var components = URLComponents(string: baseUrl)!
        components.path += path
        
        switch method {
        case .get, .delete:
            components.queryItems = params.map {
                URLQueryItem(name: $0.key, value: String(describing: $0.value))
            }
        default:
            break
        }
        
        self = components.url!
    }
}
extension URLRequest {
    init(baseUrl: String, path: String, method: HTTPMethod, params: JSON) {
        let url = URL(baseUrl: baseUrl, path: path, params: params, method: method)
        self.init(url: url)
        httpMethod = method.rawValue
        setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        switch method {
        case .post, .put:
            httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
        default:
            break
        }
    }
}

