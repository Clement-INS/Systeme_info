#include "symbols.h"
#include <stdio.h>
#include <stdlib.h>

int index = -1;
int index_for_types = -1;
int depth = 0;

void increment_depth(){
    printf("++++++");
    depth++;
}

void update_type(char* type, int constant){
    while(index_for_types < index){
        index_for_types++;
        symbols[index_for_types].type = type;
        symbols[index_for_types].constant = constant;
    }
}

void push_sym(char* name){
    index++;
    symbol sym = {.name = name, .type = NULL, .adr = index, .depth = depth};
    symbols[index] = sym;
}

void pop_symbols(){
    print_symbols();
    printf("POPING!!!\n");
    printf("\n\n");
    int copy = symbols[index].depth;
    depth--;
    while (index >= 0 && symbols[index].depth == copy){
        index--;
    }
    print_symbols();
}

void print_symbols(){
    for (int i = 0; i <= index; i++){
        printf("Name = %s, Type = %s, Adr = %d, Depth = %d, Const = %d \n", symbols[i].name, symbols[i].type, symbols[i].adr, symbols[i].depth, symbols[i].constant);
    }
}

