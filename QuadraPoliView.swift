import SwiftUI

struct SelectPoliesportivaView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    // Aqui nós alimentamos a lista com as 3 quadras poliesportivas
    let spaces = [
        SpaceModel(name: "Quadra Poliesportiva 1", imageName: "multiSportCourt"),
        SpaceModel(name: "Quadra Poliesportiva 2", imageName: "multiSportCourt"),
        SpaceModel(name: "Quadra Poliesportiva 3", imageName: "multiSportCourt")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // --- Barra Superior (Header Escuro) ---
            HStack {
                Spacer()
                Button(action: {
                    // Lógica de sair
                }) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(darkGreen)
            
            // --- Área de Título ---
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Volta para a seleção de tipos
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(darkGreen)
                }
                
                Text("Selecionar espaço")
                    .font(.custom("Georgia-Bold", size: 24))
                    .foregroundColor(darkGreen)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Rectangle()
                .fill(darkGreen)
                .frame(height: 1.5)
            
            // --- Lista de Quadras Poliesportivas ---
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(spaces) { space in
                        // Reutilizamos o SpaceCardView que você já criou!
                        NavigationLink(destination: ConfirmationView()) {
                            SpaceCardView(space: space)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.top, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
