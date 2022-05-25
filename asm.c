#include "asm.h"
#include "symbols.h"
#include <stdio.h>
#include <stdlib.h>

#define INSTRUCTIONS 1000

typedef struct
{
    char* instruction;
    int r0;
    int r1;
    int r2;
    int op_code;
    int nb_arguments;
}  asm_line;

asm_line asm_code[INSTRUCTIONS];


int index_tmp = -1;
int index_asm = 0;
int target_affect;
char* operator;
int conds[50];
int conds_else[50];
int index_cond = -1;
int index_cond_else = -1;
int start_whiles[50];
int index_while = -1;


void add_instruction(char* instruction, int r0, int r1, int r2){
    asm_line line = { .instruction = instruction, .r0 = r0, .r1 = r1, .r2 = r2 };
    if (strcmp(instruction, "ADD") == 0){
        line.op_code = 1;
        line.nb_arguments = 3;
    } 
    else if (strcmp(instruction, "MUL") == 0){
        line.op_code = 2;
        line.nb_arguments = 3;
    }
    else if (strcmp(instruction, "SOU") == 0){
        line.op_code = 3;
        line.nb_arguments = 3;
    }
    else if (strcmp(instruction, "DIV") == 0){
        line.op_code = 4;
        line.nb_arguments = 3;
    }
    else if (strcmp(instruction, "COP") == 0){
        line.op_code = 5;
        line.nb_arguments = 2;
    }
    else if (strcmp(instruction, "AFC") == 0){
        line.op_code = 6;
        line.nb_arguments = 2;
    }
    else if (strcmp(instruction, "JMP") == 0){
        line.op_code = 7;
        line.nb_arguments = 1;
    }
    else if (strcmp(instruction, "JMF") == 0){
        line.op_code = 8;
        line.nb_arguments = 2;
    }
    else if (strcmp(instruction, "INF") == 0){
        line.op_code = 9;
        line.nb_arguments = 3;
    }
    else if (strcmp(instruction, "SUP") == 0){
        line.op_code = 10;
        line.nb_arguments = 3;
    }
    else if (strcmp(instruction, "EQU") == 0){
        line.op_code = 11;
        line.nb_arguments = 3;
    }
    else if (strcmp(instruction, "PRI") == 0){
        line.op_code = 12;
        line.nb_arguments = 1;
    }
    else{
        printf("error instruction !!!\n");
    }
    asm_code[index_asm] = line;
    index_asm++;
}

void push_cond0(){
    index_cond_else++;
    conds_else[index_cond_else] = index_asm;
}

void push_cond1(){
    index_cond++;
    conds[index_cond] = index_asm;
}

void pop_cond0(){
    asm_code[conds_else[index_cond_else]].r0 = index_asm+1;
    printf("index asm : %s\n\n", asm_code[conds[index_cond_else]].instruction);
    printf("R0 : %d\n\n", asm_code[conds[index_cond_else]].r0);
    index_cond_else--;
}

void pop_cond1(){
    asm_code[conds[index_cond]].r1 = index_asm+1;
    index_cond--;
}

void remove_jmp(){
    index_asm--;
    for (int i = 0; i <= index_asm; i++){
        if (strcmp(asm_code[i].instruction, "JMF") == 0 && asm_code[i].r1 > index_asm){
            asm_code[i].r1--;
        }
        else if (strcmp(asm_code[i].instruction, "JMP") == 0 && asm_code[i].r0 > index_asm){
            asm_code[i].r0--;
        }
    }
}

void push_while(){
    index_while++;
    start_whiles[index_while] = index_asm;
}

void pop_while(){
    add_instruction("JMP", start_whiles[index_while]+1, -1, -1);
    index_while--;
}

int push_tmp(){
    index_tmp++;
    return 200+index_tmp;
}

int pop_tmp(){
    index_tmp--;
    return 201+index_tmp;
}

void add_operation(char* name){
    int right = pop_tmp();
    int left = pop_tmp();
    add_instruction(name, left, left, right);
    push_tmp();
}

void print_instruction_table(){
    FILE* as;
    FILE* asm_hexa;
    as = fopen("./output_asm/asm", "w+");
    asm_hexa = fopen("./output_asm/asm_hexa", "w+");
    for (int i = 0; i < index_asm; i++){
        printf("Instruction = %s, R0 = %d, R1 = %d, R2 = %d, OP = %d\n", asm_code[i].instruction, asm_code[i].r0, asm_code[i].r1, asm_code[i].r2, asm_code[i].op_code);
        fprintf(as, "%s ", asm_code[i].instruction);
        fprintf(asm_hexa, "%d ", asm_code[i].op_code);
        switch (asm_code[i].nb_arguments)
        {
        case 1:
            fprintf(as, "%d", asm_code[i].r0);
            fprintf(asm_hexa, "%d", asm_code[i].r0);
            break;
        case 2:
            fprintf(as, "%d %d", asm_code[i].r0, asm_code[i].r1);
            fprintf(asm_hexa, "%d %d", asm_code[i].r0, asm_code[i].r1);
            break;
        case 3:
            fprintf(as, "%d %d %d", asm_code[i].r0, asm_code[i].r1, asm_code[i].r2);
            fprintf(asm_hexa, "%d %d %d", asm_code[i].r0, asm_code[i].r1, asm_code[i].r2);
            break;
        default:
            exit(2);
            break;
        }
        fprintf(as, "\n");
        fprintf(asm_hexa, "\n");
    }
}