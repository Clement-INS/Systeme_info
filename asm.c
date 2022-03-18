#include "asm.h"
#include "symbols.h"
#include <stdio.h>
#include <stdlib.h>

int index_asm = 0;
int target_affect;
char* operator;

void add_instruction(char* instruction, int r0, int r1, int r2){
    asm_line line = { .instruction = instruction, .r0 = r0, .r1 = r1, .r2 = r2 };
    if (strcmp(instruction, "ADD") == 0){
        line.op_code = 1;
    } 
    else if (strcmp(instruction, "MUL") == 0){
        line.op_code = 2;
    }
    else if (strcmp(instruction, "SOU") == 0){
        line.op_code = 3;
    }
    else if (strcmp(instruction, "DIV") == 0){
        line.op_code = 4;
    }
    else if (strcmp(instruction, "COP") == 0){
        line.op_code = 5;
    }
    else if (strcmp(instruction, "AFC") == 0){
        line.op_code = 6;
    }
    else if (strcmp(instruction, "JMP") == 0){
        line.op_code = 7;
    }
    else if (strcmp(instruction, "JMF") == 0){
        line.op_code = 8;
    }
    else if (strcmp(instruction, "INF") == 0){
        line.op_code = 9;
    }
    else if (strcmp(instruction, "SUP") == 0){
        line.op_code = 10;
    }
    else if (strcmp(instruction, "EQU") == 0){
        line.op_code = 11;
    }
    else if (strcmp(instruction, "PRI") == 0){
        line.op_code = 12;
    }
    else{
        printf("error instruction !!!\n");
    }
    asm_code[index_asm] = line;
    index_asm++;
}

void select_result(char* variable){
    printf("select_result\n");
    target_affect = get_adr(variable);
}

void select_operator(char* op){
    printf("select_operator\n");
    operator = op;
}

void reset_operator(){
    printf("reset_operator\n");
    operator = NULL;
}

void add_result_number(int number){
    printf("add_result_number\n");
    if (operator == NULL){
        add_instruction("AFC", target_affect, number, -1);
    }
    else{
        add_instruction("AFC", 200, number, -1); //200 correspond à la première adresse non disponible pour les variables
        add_instruction(operator, target_affect, target_affect, 200);
    }
}

void add_result_variable(char* name_variable){
    printf("add_result_variable\n");
    int adr = get_adr(name_variable);
    if (operator == NULL){
        add_instruction("COP", target_affect, adr, -1);
    }
    else{
        add_instruction(operator, target_affect, target_affect, adr);
    }
}

void print_instruction_table(){
    for (int i = 0; i < index_asm; i++){
        printf("Instruction = %s, R0 = %d, R1 = %d, R2 = %d, OP = %d\n", asm_code[i].instruction, asm_code[i].r0, asm_code[i].r1, asm_code[i].r2, asm_code[i].op_code);
    }
}