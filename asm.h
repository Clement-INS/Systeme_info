#ifndef ASM
#define ASM

void add_instruction(char* instruction, int r0, int r1, int r2);

int push_tmp();

int pop_tmp();

void reset_tmp();

void select_result(char* variable);

void select_operator(char* op);

void reset_operator();

void add_result_number(int number);

void add_result_variable(char* name_variable);

void print_instruction_table();

#endif