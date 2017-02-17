# all : generalement la première du fichier, elle regroupe dans ces dependances l'ensemble des executables à produire.
# clean : elle permet de supprimer tout les fichiers intermediaires.
# mrproper : elle supprime tout ce qui peut être regenere et permet une reconstruction complète du projet.

#  CC designe (une telle variable est typiquement nommé CC pour un compilateur C, CXX pour un compilateur C++).
#  CFLAGS regroupant les options de compilation (Généralement cette variable est nommées CFLAGS pour une compilation en C, CXXFLAGS pour le C++).
#  LDFLAGS regroupant les options de l'édition de liens.
#  EXEC contenant le nom des exécutables à générer.

## $@ 	Le nom de la cible
## $< 	Le nom de la première dépendance
## $^ 	La liste des dépendances
## $? 	La liste des dépendances plus récentes que la cible
## $* 	Le nom du fichier sans suffixe

# cible particulière nommée .PHONY dont les dépendances seront systématiquement reconstruites
# la commande wildcard qui permet l'utilisation des caractères joker
# désactiver l'écho des lignes de commandes en rajoutant le caractère @
DEBUG=yes
CC=g++
LIBRARY=yes
ifeq ($(DEBUG),yes)
	CFLAGS=-W -Wall -ansi -pedantic -g  -I/usr/include/ -I/usr/include/cppcon -std=c++11
	LDFLAGS= -L/usr/lib  -lmysqlcppconn 
else
	CFLAGS=-W -Wall -ansi -pedantic  -I/usr/include -I/usr/include/cppcon -lmyqlcppcon  -std=c++11
	LDFLAGS=
endif
EXEC=exec
SRC=$(wildcard *.c)
OBJDIR=obj
OBJ= $(SRC:.c=.o)

all: $(EXEC) $(LIB)

ifeq ($(DEBUG),yes)
	echo "debug mode"
else
	echo "release mode"
endif

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) -o $@ -c  $< $(CFLAGS)

.PHONY: clean mrproper

clean:
	rm -rf *.o
	rm exec

mrproper: clean
	rm -rf $(EXEC)
