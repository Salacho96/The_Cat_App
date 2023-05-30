//the cat app
//Andres Felipe Salazar Rojas
//https://www.youtube.com/watch?v=CimY_Sr3gWw
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ListView()) {
                    Text("Tap to Go Check the Cats")
                }
            }
            .navigationTitle("The Cat Api")
        }
    }
}

//Snippet for automatic preview ios device
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

