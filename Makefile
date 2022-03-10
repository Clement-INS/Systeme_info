GRM=analyseur.y
LEX=analyseur.l
BIN=analyseur.out
SYM=symbols.out

CC=gcc
CFLAGS=-Wall -g

OBJ=y.tab.o lex.yy.o #main.o

all: $(BIN)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

y.tab.c: $(GRM)
	yacc -v -d $<

lex.yy.c: $(LEX)
	flex $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) symbols.c $^ -o $@



clean:
	rm $(OBJ) y.tab.c y.tab.h lex.yy.c analyseur.out symbols.out

tests_ok: all
	./tests_ok.sh

tests_ko: all
	./tests_ko.sh
