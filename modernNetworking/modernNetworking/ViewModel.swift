
import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    
    var cancellationToken: AnyCancellable?
    
    init() {
        getRecipes() 
    }
    
}

extension ViewModel {
    
    func getRecipes() {
        
        do{
            
            let values = try APIRouter.getRecipes()
            
            cancellationToken = values.mapError({ (error) -> Error in // 5
                return error
            }).sink(receiveCompletion: { _ in }, receiveValue: {
                self.recipes = $0.results ?? []
            })

        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
}
