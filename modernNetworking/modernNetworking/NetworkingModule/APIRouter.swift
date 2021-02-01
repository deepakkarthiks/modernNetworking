import Combine
class APIRouter {
        
    private static let client = APIClient(baseUrl: APIConstants.baseURL)
    
    static func getRecipes() throws -> AnyPublisher<RecipePuppy, Error>{
        return try run(method: .get)
    }
    
    static func run<T: Decodable>(forPath path: String = "", method: HTTPMethod, params: JSON = [:]) throws -> AnyPublisher<T, Error> {
        return try client.loadRequest(forPath: path, method: method, params: params).map(\.value).eraseToAnyPublisher()
    }
}

