#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void generate_random_string(char *str, size_t size) {
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (size_t i = 0; i < size - 1; i++) {
        int key = rand() % (sizeof(charset) - 1);
        str[i] = charset[key];
    }
    str[size - 1] = '\0';
}

#define SIZE 16384 // 32KB

int main() {
    // Initialize random number generator
    srand(7000);

    // Allocate memory for the string
    char *random_string = (char *)malloc(SIZE * sizeof(char));
    if (random_string == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }

    // Generate the random string
    generate_random_string(random_string, SIZE);

    printf("\"%s\";\n", random_string);

    // Free the allocated memory
    free(random_string);

    return 0;
}
