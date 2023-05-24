//the cat app
//Andres Felipe Salazar Rojas
//https://www.youtube.com/watch?v=CimY_Sr3gWw
import SwiftUI
import Combine


struct Cat: Hashable, Codable{
    struct Weight: Codable {
        let imperial: String
        let metric: String
    }
    let name: String
    let id: String
    let description: String
}

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


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.cats, id: \.self){
                    Cat in HStack{
                        Text(Cat.name)
                    }.padding(3)
                }
            }.navigationTitle("The Cat API")
                .onAppear{
                    viewModel.fetch()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

