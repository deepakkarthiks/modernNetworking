
import Foundation
import Combine
typealias JSON = [String: Any]
final class APIClient {
    
    private var baseUrl: String
        
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func loadRequest<T: Decodable>(forPath path: String = "", method: HTTPMethod, params: JSON = [:]) throws -> AnyPublisher<Response<T>, Error>  {
        
        if !Reachability.isConnectedToNetwork() {
            throw ServiceError.noInternetConnection
        }
        
        let request = URLRequest(baseUrl: baseUrl, path: path, method: method, params: params)
        
         return URLSession.shared.dataTaskPublisher(for: request).tryMap {
            result -> Response<T> in
                do {
                    let value = try JSONDecoder().decode(T.self, from: result.data)
                    return Response(value: value, response: result.response)
                } catch{
                    throw ServiceError.custom("JSON Decoder Error")
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
