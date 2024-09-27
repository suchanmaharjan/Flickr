import Foundation
import Combine

class HomeViewModel : ObservableObject {
    @Published var searchQuery = ""
    @Published var errorMessage = ""
    @Published var viewState = ViewState.Idle
    @Published var flickrArray = [FlickrItem]()
    private var cancellables = Set<AnyCancellable>()
    let repo = AppRepository()
    
    init() {
        setSearchTextPublisher()
    }
    
    func setSearchTextPublisher() {
        $searchQuery
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.onSearchQueryChanged()
            }
            .store(in: &cancellables)
    }
    
    private func onSearchQueryChanged() {
        if searchQuery.isEmpty {
            if (flickrArray.isEmpty) {
                self.viewState = ViewState.Idle
            }
        }
        else {
            fetchRequest()
        }
    }
    
    private func fetchRequest() {
        viewState = ViewState.Loading
        repo.callSearchApi(searchQuery)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                print(completion)
                switch completion {
                case .failure(let error):
                    self?.handleError(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.flickrArray.removeAll()
                self?.flickrArray.append(contentsOf: response.items ?? [])
                if self?.flickrArray.isEmpty == true {
                    self?.handleError(message: "No search results for \(self?.searchQuery ?? "")")
                }
                else {
                    self?.viewState = ViewState.Success
                }
            }.store(in: &cancellables)
        
    }
    
    private func handleError(message : String) {
        errorMessage = message
        viewState = ViewState.Error
    }
}
