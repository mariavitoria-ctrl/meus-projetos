#include <iostream>
using namespace std;

int main(int argc, char** argv) {
    char reserva[10][6] = {
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', ' '}
    };
    int fileira = -1, acento = -1;
    char poltrona = ' ';
    char tipoPassagem = ' ';

    while (true) {
        // Boas-vindas da Vitória Airlines
        cout << "=========================================\n";
        cout << "       Bem-vindo à vitoria Airlines!       \n";
        cout << "=========================================\n";
        cout << "          Vamos reservar seu assento!     \n";
        cout << "-----------------------------------------\n";

        // Solicita o tipo de passagem
        cout << "Digite o tipo de passagem (E - Econômica, X - Executiva): ";
        cin >> tipoPassagem;

        cout << "\nDigite a fileira (1-10): ";
        cin >> fileira;

        cout << "\nDigite a poltrona [A][B][C][D][E][F]: ";
        cin >> poltrona;

        // Mapeia as letras para índices de coluna
        switch (poltrona) {
            case 'A': acento = 0; break;
            case 'B': acento = 1; break;
            case 'C': acento = 2; break;
            case 'D': acento = 3; break;
            case 'E': acento = 4; break;
            case 'F': acento = 5; break;
            default:
                cout << "Poltrona inválida." << endl;
                continue; // Volta ao início do loop
        }

        // Condição para restringir assentos na classe econômica
        if (tipoPassagem == 'E' && (poltrona == 'A' || poltrona == 'F')) {
            cout << "Assentos A e F são exclusivos para passageiros Executivos." << endl;
            continue; // Volta para o início do loop
        }

        // Condição para perguntar ao passageiro executivo sobre a prioridade
        if (tipoPassagem == 'X' && (poltrona != 'A' && poltrona != 'F')) {
            char confirmar;
            cout << "Recomendamos os assentos A e F para passageiros Executivos, pois são prioritários para essa classe." << endl;
            cout << "Deseja reservar o assento " << poltrona << " mesmo assim? (s/n): ";
            cin >> confirmar;

            // Se o passageiro não quiser confirmar, reinicia o loop
            if (confirmar == 'n' || confirmar == 'N') {
                cout << "Por favor, escolha um novo assento." << endl;
                continue; // Volta ao início do loop para uma nova escolha
            }
        }

        // Verifica se o assento já está ocupado
        if (reserva[fileira - 1][acento] != ' ') {
            cout << "Assento já está ocupado." << endl;
            continue; // Volta para o início do loop
        }

        // Reserva o assento
        reserva[fileira - 1][acento] = (tipoPassagem == 'X') ? 'X' : 'O';
        cout << "Assento reservado com sucesso!" << endl;

        // Mostra o mapa de assentos
        cout << "\n\t\t[A] [B] [C]\t\t[D] [E] [F]\n";
        for (int x = 0; x < 10; x++) {
            if (x < 9) cout << "\n\t0" << x + 1 << "\t";
            else cout << "\n\t" << x + 1 << "\t";

            for (int y = 0; y < 6; y++) {
                cout << "[" << reserva[x][y] << "] ";
                if (y == 2) cout << "\t";
            }
        }

        // Pergunta se deseja realizar outra reserva
        char continuar;
        cout << "\nDeseja realizar outra reserva? (s/n): ";
        cin >> continuar;

        if (continuar == 'n' || continuar == 'N') {
            cout << "Encerrando o sistema de reservas da Vitoria Airlines..." << endl;
            break;
        }
        cout << "\n";
    }

    return 0;
}