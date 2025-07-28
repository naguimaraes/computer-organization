#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool isPrime(int n) 
{ 
    // Corner case 
    if (n <= 1) 
        return false; 
  
    // Check from 2 to square root of n
    for (int i = 2; i <= n; i++){
        if (i > sqrt(n))
            break;
        if (n % i == 0) 
            return false; 
    } 
  
    return true; 
} 
  
#define count 40000
int main() 
{
    int prime_count = 0;
    for (size_t i = 0; i < count; i++)
    {
        bool is_prime = isPrime(i);
        prime_count += is_prime;
    }
    // NoP = Number of Primes
    printf("NoP: %d\n", prime_count);

    return 0; 
} 