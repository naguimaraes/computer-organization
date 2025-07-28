// C code to implement Kruskal's algorithm

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

// Comparator function to use in sorting
int comparator(const void *p1, const void *p2)
{
    const int(*x)[3] = p1;
    const int(*y)[3] = p2;

    return (*x)[2] - (*y)[2];
}

// Initialization of parent[] and rank[] arrays
void makeSet(int parent[], int rank[], int n)
{
    for (int i = 0; i < n; i++)
    {
        parent[i] = i;
        rank[i] = 0;
    }
}

// Function to find the parent of a node
int findParent(int parent[], int component)
{
    if (parent[component] == component)
        return component;

    return parent[component] = findParent(parent, parent[component]);
}

// Function to unite two sets
void unionSet(int u, int v, int parent[], int rank[], int n)
{
    // Finding the parents
    u = findParent(parent, u);
    v = findParent(parent, v);

    if (rank[u] < rank[v])
    {
        parent[u] = v;
    }
    else if (rank[u] > rank[v])
    {
        parent[v] = u;
    }
    else
    {
        parent[v] = u;

        // Since the rank increases if
        // the ranks of two sets are same
        rank[u]++;
    }
}
// Function to find the MST
int kruskalAlgo(int **edge, int SIZE)
{
    // First we sort the edge array in ascending order
    // so that we can access minimum distances/cost
    //printf("Sorting the edges based on weight...\n");
    qsort(edge, SIZE, sizeof(edge[0]), comparator);
    //printf("Edges sorted successfully!\n");

    int *parent = (int *)malloc(SIZE * sizeof(int));
    if (parent == NULL)
    {
        printf("Memory allocation failed\n");
        return 0;
    }
    int *rank = (int *)malloc(SIZE * sizeof(int));
    if (rank == NULL)
    {
        printf("Memory allocation failed\n");
        return 0;
    }

    // Function to initialize parent[] and rank[]
    //printf("Initializing parent[] and rank[] arrays...\n");
    makeSet(parent, rank, SIZE);
    //printf("Initialization successful!\n");

    // To store the minimun cost
    int minCost = 0;

    //printf("Following are the edges in the constructed MST\n");
    for (int i = 0; i < SIZE; i++)
    {
        int v1 = findParent(parent, edge[i][0]);
        int v2 = findParent(parent, edge[i][1]);
        int wt = edge[i][2];

        // If the parents are different that
        // means they are in different sets so
        // union them
        if (v1 != v2)
        {
            unionSet(v1, v2, parent, rank, SIZE);
            minCost += wt;
            // printf("%d -- %d == %d\n", edge[i][0], edge[i][1], wt);
        }
    }

    return minCost;
}

#define SIZE_IN_KB 64
#define size_in_bytes (SIZE_IN_KB * 1024)
#define num_elements (size_in_bytes / 4)
#define RUNS 360

// Driver code
int main()
{
    // Calcula o tamanho da matriz (n x n)
    int n = (int)sqrt(num_elements);

    // Garante que a matriz seja quadrada e a diagonal principal seja zero
    int **edge = (int **)malloc(n * sizeof(int *));
    int **current_edge = (int **)malloc(n * sizeof(int *));
    if (edge == NULL || current_edge == NULL)
    {
        printf("Memory allocation failed\n");
        return 1;
    }
    for (int i = 0; i < n; i++)
    {
        edge[i] = (int *)malloc(n * sizeof(int));
        current_edge[i] = (int *)malloc(n * sizeof(int));
        if (edge[i] == NULL || current_edge[i] == NULL)
        {
            printf("Memory allocation failed\n");
            return 1;
        }
    }

    // Inicializa o gerador de números aleatórios
    srand(7000);

    // Preenche a matriz com valores aleatórios e a torna simétrica
    for (int i = 0; i < n; i++)
    {
        for (int j = i; j < n; j++)
        {
            if (i == j)
            {
                edge[i][j] = 0; // Diagonal principal deve ser zero
            }
            else
            {
                int value = rand() % 100 + 1; // Valores entre 1 e 100
                edge[i][j] = value;
                edge[j][i] = value; // Simetria
            }
        }
    }

    int minCost = 0;
    for (int i = 0; i < RUNS; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int k = 0; k < n; k++)
            {
                current_edge[j][k] = edge[j][k];
            }
        }
        int ret = kruskalAlgo((int **)current_edge, n);
        minCost = ret > minCost ? ret : minCost;
    }
    // Minimum Cost Spanning Tree = MCST
    printf("MCST: %d\n", minCost);

    // for (int i = 0; i < n; i++)
    // {
    //     free(edge[i]);
    //     free(current_edge[i]);
    // }
    // free(edge);
    // free(current_edge);
    return 0;
}