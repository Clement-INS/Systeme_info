#ifndef SYMBOLS
#define SYMBOLS

#define TABLE_SIZE 200

typedef struct
{
    char* name;
    char* type;
    int adr;
    int depth;
    int constant; 
}  symbol;

symbol symbols[TABLE_SIZE];

void increment_depth();

void decrement_depth();

void update_type(char* type, int constant);

void push_sym(char* name);

void pop_symbols();

void print_symbols();

#endif