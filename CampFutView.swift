import SwiftUI

struct SelectFutebolView: View {
    
    // Variável de ambiente para controlar o botão de voltar
    @Environment(\.presentationMode) var presentationMode
    
    // Nossa cor padrão do projeto
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    // Alimentando a lista com apenas as 2 opções da imagem
    let spaces = [
        SpaceModel(name: "Campo De Futebol 1", imageName: "soccerField"),
        SpaceModel(name: "Campo De Futebol 2", imageName: "soccerField")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            // --- Barra Superior (Header Escuro) ---
            HStack {
                Spacer()
                Button(action: {
                    // Lógica do botão de sair
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
                    // Ação de voltar para a tela de Seleção de Tipos
                    presentationMode.wrappedValue.dismiss()
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
            
            // Linha verde separadora
            Rectangle()
                .fill(darkGreen)
                .frame(height: 1.5)
            
            // --- Lista de Campos de Futebol ---
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(spaces) { space in
                        // Clicar no campo leva para a tela de confirmação final
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
        .navigationBarHidden(true) // Oculta barra do iOS
        .navigationBarBackButtonHidden(true) // Oculta botão de voltar nativo do iOS
    }
}

