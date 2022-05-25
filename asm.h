#ifndef ASM
#define ASM

//Ajoute une instruction assembleure dans le tableau des instructions
void add_instruction(char* instruction, int r0, int r1, int r2);

//Retient l'adresse de l'instruction jmf du if pour pouvoir changer ses arguments plus tard 
void push_cond0();

//Pareil mais pour le Else (JMP)
void push_cond1();

//Modifie l'adresse de jump du JMF correspondant au dernier else
void pop_cond0();

//Modifie l'adresse de jump du JMP correspondant au dernier if
void pop_cond1();

//Enleve l'instruction JMP si il n'y a pas de else
void remove_jmp();

//Retient l'adresse du début du while pour pouvoir plus tard faire un jmp dessus
void push_while();

//JMP au début du while
void pop_while();

//Push une variable temporaire dans la pile, renvoie son adresse
int push_tmp();

//Enlève une variable temporaire de la pile, renvoie son adresse
int pop_tmp();

//Ajoute une opération entre 2 variables temporaires
void add_operation(char* name);

//Ecrit l'ensemble des instructions dans les fichiers asm et asm_hexa du dossier output_asm
void print_instruction_table();

#endif