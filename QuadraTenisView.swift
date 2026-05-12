import SwiftUI

// 1. Modelo de Dados
struct SpaceModel: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String // Nome da imagem nos seus Assets (ex: "tennisCourt")
}

// 2. Componente do Cartão (SpaceCardView) DEFINITIVO
struct SpaceCardView: View {
    let space: SpaceModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // IMAGEM DE FUNDO ATUALIZADA
            Image(space.imageName)
                .resizable()
                .scaledToFill() // Garante que a imagem preencha, cortando se necessário
                // Força a imagem a ter a altura total do cartão (120)
                .frame(height: 120)
                // CRÍTICO: Força a imagem a preencher toda a largura disponível
                .frame(maxWidth: .infinity)
                .clipped() // Corta o excesso de imagem que transbordar
                .cornerRadius(10) // Aplica os cantos arredondados na imagem interna

            // TEXTO SOBREPOSTO
            Text(space.name)
                .font(.system(size: 18, weight: .regular, design: .serif))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
                .padding(.horizontal, 12)
                .background(Color.black.opacity(0.7))
                .padding(.bottom, 8)
        }
        .frame(height: 120) // Define a altura total do cartão (container)
        .cornerRadius(10)   // Aplica o raio em todo o cartão
        .overlay(           // Borda preta em volta de todo o cartão
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 2)
        )
        .padding(.horizontal) // Padding externo para separação lateral
        .padding(.vertical, 6)   // Padding externo para separação vertical
    }
}

// 3. Tela Principal de Seleção de Quadras (SelectSpaceView)
struct SelectSpaceView: View {
    
    // Variável para controlar a ação de "voltar" para a tela anterior
    @Environment(\.presentationMode) var presentationMode
    
    // Cor verde escura personalizada
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    // Lista de quadras mockadas
    let spaces = [
        SpaceModel(name: "Quadra De Tênis 1", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 2", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 3", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 4", imageName: "tennisCourt"),
        SpaceModel(name: "Quadra De Tênis 5", imageName: "tennisCourt")
    ]
    
    var body: some View {
        // ATENÇÃO: O NavigationView não existe mais aqui, pois está na tela anterior.
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
                    // Agora este botão fecha esta tela e volta para a tela de Tipos de Espaço
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
            
            // --- Lista de Quadras com Links de Navegação ---
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(spaces) { space in
                        // O Link para a ConfirmationView continua funcionando normalmente
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
        .navigationBarHidden(true) // Mantém a barra padrão oculta durante a transição
        .navigationBarBackButtonHidden(true) // Garante que o botão '< Back' padrão não apareça
    }
}


