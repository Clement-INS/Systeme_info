#ifndef ASM
#define ASM

#define INSTRUCTIONS 1000

typedef struct
{
    char* instruction;
    int r0;
    int r1;
    int r2;
    int op_code;
}  asm_line;

asm_line asm_code[INSTRUCTIONS];

void select_result(char* variable);

void select_operator(char* op);

void reset_operator();

void add_result_number(int number);

void add_result_variable(char* name_variable);

void print_instruction_table();

#endif