#ifndef ASM
#define ASM

void add_instruction(char* instruction, int r0, int r1, int r2);

void push_cond();

void pop_cond();

void push_while();

void pop_while();

int push_tmp();

int pop_tmp();

void add_operation(char* name);

void print_instruction_table();

#endif