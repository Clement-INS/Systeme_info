#ifndef SYMBOLS
#define SYMBOLS

//Augmente le scope
void increment_depth();

//Diminue le scope
void decrement_depth();

//Met à jour le type dans la table des symboles de toutes les variables déclarées sur une ligne 
void update_type(char* type, int constant);

//Ajoute un symbole dans la table des symboles
void push_sym(char* name);

//Enlève toutes les variables de la table des symboles ne faisant plus partie du nouveau scope 
void pop_symbols();

//Affiche la table des symboles
void print_symbols();

//Renvoie l'adresse d'une variable, exit(2) si la variable n'existe pas
int get_adr(char* name);

//Renvoie 1 si la variable est une constante 0 sinon
int isconst(char* name);

#endif