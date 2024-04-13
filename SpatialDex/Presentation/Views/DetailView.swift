import SwiftUI

struct DetailView: View {
    let pokemon: Pokemon
    @State var isShowing3dModel = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: pokemon.artwork!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    .background()
                    .clipShape(.buttonBorder)
                    Spacer().frame(width: 16)
                    HStack {
                        VStack {
                            HStack {
                                Text(pokemon.name.capitalized)
                                    .font(.title)
                                Text("#\(pokemon.id)")
                                Spacer()
                            }
                            HStack {
                                Text(pokemon.pseudonym!.capitalized)
                                Spacer()
                            }.padding(.bottom, 8)
                            VStack {
                                ForEach(pokemon.types ?? [], id: \.self) { type in
                                    TypeView(title: type)
                                }
                            }
                            
                            Spacer()
                            
                            HStack {
                                Text("Abilities:").italic()
                                ForEach(pokemon.abilities ?? [], id: \.self) { ability in
                                    let text = pokemon.abilities?.last == ability ? ability.capitalized : "\(ability.capitalized),"
                                    Text(text).italic()
                                }
                                Spacer()
                            }
                            
                        }
                        .padding()
                        .padding(.leading, 8)
                        
                        Spacer()
                    }.frame(height: 200)
                        .background()
                        .clipShape(.buttonBorder)
                }
                
                Spacer().frame(height: 20)
                
                HStack {
                    Spacer()
                    Text("\" \(pokemon.description!) \"")
                        .italic()
                    Spacer()
                }
                .padding(.vertical, 50)
                .background()
                .clipShape(.buttonBorder)
                Spacer()
                
            }.padding()
            
            if isShowing3dModel && CustomModels.existModel(for: pokemon) {
                ModelView(pokemon: pokemon)
            }
            
        }
        
        .toolbar {
            if CustomModels.existModel(for: pokemon) {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("View in 3D", systemImage: "cube") {
                        isShowing3dModel = !isShowing3dModel
                    }
                }
            }
        }
    }
}
