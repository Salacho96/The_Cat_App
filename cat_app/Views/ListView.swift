//the cat app
//Andres Felipe Salazar Rojas
//https://www.youtube.com/watch?v=CimY_Sr3gWw
import SwiftUI
import Combine

//Snippet to declare the data we are going to get from the api
struct Cat: Hashable, Codable{
    struct Weight: Codable {
        let imperial: String
        let metric: String
    }
    let name: String
    let id: String
    let origin: String
    let country_codes: String
    let description: String
}

//Snippet to fetch the api information
class ViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    func fetch(){
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _,
            error in
            guard let data = data, error == nil else {
                return
            }
            //convert to json
            do{
                let cats = try JSONDecoder().decode([Cat].self,
                from: data)
                DispatchQueue.main.async{
                    self?.cats=cats
                }
                
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
}


struct ListView: View {
    @StateObject var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingContentView = false
        
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.cats, id: \.self) { cat in HStack {
                    Text(cat.name)
                }
                .padding(3)
                }
            }
            .navigationTitle("The Cat Api")
            .onAppear {
                viewModel.fetch()
            }
            .toolbar {
                Button(action: {
                    isShowingContentView = true
                }){
                    Text("Go to Content View")
                }
            }
            .sheet(isPresented: $isShowingContentView) {
                ContentView()
            }
        }
        //.navigationTitle("Detail")
    }
}

//Snippet for automatic preview ios device

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
