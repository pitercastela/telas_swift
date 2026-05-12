import SwiftUI

struct ConfirmationView: View { // Correção aplicada: sem a palavra 'some' aqui
    
    // Variável de ambiente para controlar a navegação no Xcode 13
    @Environment(\.presentationMode) var presentationMode
    
    // Cor verde escura padrão do seu layout
    let darkGreen = Color(red: 0.12, green: 0.29, blue: 0.16)
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // --- Ícone de Confirmação ---
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 140)
                .foregroundColor(darkGreen)
                .padding(.bottom, 30)
            
            // --- Título de Confirmação ---
            Text("Reserva\nconfirmada!")
                .font(.custom("Georgia-Bold", size: 32))
                .multilineTextAlignment(.center)
                .foregroundColor(darkGreen)
            
            // --- Linha Separadora ---
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 250, height: 1.5)
                .padding(.vertical, 25)
            
            // --- Detalhes da Reserva ---
            VStack(spacing: 10) {
                Text("Quadra de tênis 1")
                Text("Dia: 15 de Junho")
                Text("Horário: 10h - 12h")
            }
            .font(.custom("Georgia-Bold", size: 22))
            .foregroundColor(darkGreen)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            // --- Botão Inferior ---
            Button(action: {
                // Ação para fechar a tela atual e voltar para a SelectSpaceView
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Voltar ao início")
                    .font(.custom("Georgia-Bold", size: 20))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 18)
                    .background(darkGreen)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
        }
        .background(Color.white) // Garante que o fundo não fique transparente
        .edgesIgnoringSafeArea(.all) // Faz a tela preencher todo o espaço do dispositivo
        
        // Modificadores essenciais para manter o seu design personalizado
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

