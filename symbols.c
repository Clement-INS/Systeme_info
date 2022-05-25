#include "symbols.h"
#include <stdio.h>
#include <stdlib.h>

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

int index_sym = -1;
int index_sym_for_types = -1;
int depth = 0;

void increment_depth(){
    depth++;
}

void update_type(char* type, int constant){
    while(index_sym_for_types < index_sym){
        index_sym_for_types++;
        symbols[index_sym_for_types].type = type;
        symbols[index_sym_for_types].constant = constant;
    }
}

void push_sym(char* name){
    index_sym++;
    symbol sym = {.name = name, .type = NULL, .adr = index_sym, .depth = depth};
    symbols[index_sym] = sym;
}

void pop_symbols(){
    while (index_sym >= 0 && symbols[index_sym].depth == depth){
        index_sym--;
    }
    depth--;
}

void print_symbols(){
    for (int i = 0; i <= index_sym; i++){
        printf("Name = %s, Type = %s, Adr = %d, Depth = %d, Const = %d \n", symbols[i].name, symbols[i].type, symbols[i].adr, symbols[i].depth, symbols[i].constant);
    }
}

int get_adr(char* name){
    int i = 0;
    while (i <= index_sym){
        if (strcmp(name, symbols[i].name) == 0){
            return symbols[i].adr;
        }
        i++;
    }
    printf("Variable not declared !!! \n");
    exit(2);
    return -1;
}

int isconst(char* name){
    int i = 0;
    while (i <= index_sym){
        if (strcmp(name, symbols[i].name) == 0){
            return symbols[i].constant;
        }
        i++;
    }
    return 0;
}