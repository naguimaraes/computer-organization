#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

// Define o tamanho da matriz em kB
#define SIZE_IN_KB 16

int main() {
    // Converte o tamanho de kB para bytes
    int size_in_bytes = SIZE_IN_KB * 1024;
    
    // Cada elemento da matriz é um inteiro de 4 bytes
    int num_elements = size_in_bytes / 4;
    
    // Calcula o tamanho da matriz (n x n)
    int n = (int)sqrt(num_elements);
    
    // Garante que a matriz seja quadrada e a diagonal principal seja zero
    int matrix[n][n];

    // Inicializa o gerador de números aleatórios
    srand(time(NULL));

    // Preenche a matriz com valores aleatórios e a torna simétrica
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            if (i == j) {
                matrix[i][j] = 0; // Diagonal principal deve ser zero
            } else {
                int value = rand() % 100 + 1; // Valores entre 1 e 100
                matrix[i][j] = value;
                matrix[j][i] = value; // Simetria
            }
        }
    }

    // Imprime a matriz
    printf("{ ");
    for (int i = 0; i < n; i++) {
        printf("{ ");
        for (int j = 0; j < n; j++) {
            printf("%d, ", matrix[i][j]);
        }
        printf("}, ");
    }
    printf("};\n");

    printf("Matrix size: %d x %d\n", n, n);
    return 0;
}
