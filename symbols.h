#ifndef SYMBOLS
#define SYMBOLS

void increment_depth();

void decrement_depth();

void update_type(char* type, int constant);

void push_sym(char* name);

void pop_symbols();

void print_symbols();

int get_adr(char* name);

int isconst(char* name);

#endif