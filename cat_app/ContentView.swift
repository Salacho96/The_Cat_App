//the cat app
//Andres Felipe Salazar Rojas
import SwiftUI



struct ContentView: View {
    
    
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
                Image(systemName: "cat")
                
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
            
            .padding()
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
