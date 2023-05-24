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

class ViewModel: ObservableObject{
    func fetch (){
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data,
            ,error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let courses = try JSONDecoder().decode([Cat].self,
                    from: data)
            }
            catch{
                print(error)
            }
            
        }
    }
}


struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            List{
                
            }.navigationTitle("The Cat API")
        }
        
    }
}
