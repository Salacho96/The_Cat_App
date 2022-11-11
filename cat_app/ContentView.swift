//the cat app
//Andres Felipe Salazar Rojas
import SwiftUI



struct ContentView: View {
    
    @State private var quoteData: QuoteData?
    
    //let _ = self.print(QuoteData)
    
    var body: some View {
       
        ScrollView{
            Text("CatBreeders")
                .font(.largeTitle)
            Spacer()
            Spacer()
            VStack {
                HStack{
                    Spacer()
                    Text("Nombre")
                    Spacer()
                    Text("Raza")
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
                Spacer()
                Image(systemName: "globe")
                
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            HStack{
                Spacer()
                Text("Pais de Origen")
                Spacer()
                Text("Inteligencia")
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }
            Text(quoteData?.id ?? "")
            
            .padding()
        }
        
    }
    
    //call api
    private func loadData(){
        guard let url = URL(string:" https://api.thecatapi.com/v1/breeds")else{
            return
        }
        URLSession.shared.dataTask(with: url){
            data, response, error in guard let data = data else {return}
            if let decodedData = try? JSONDecoder().decode(QuoteData.self, from: data){
                DispatchQueue.main.async {
                    self.quoteData=decodedData
                }
            }
        }.resume()
    }
    
}
    


struct QuoteData: Decodable{
    var id: String
    var breedName: String
    var origin: String
    var affectionLevel: Int
    var Intelligence: Int
    var ImageUrl: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
