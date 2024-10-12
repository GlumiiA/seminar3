JAVAC = javac
JAVA = java
LIB_DIR = lib
LIBS = $(LIB_DIR)/fcgi.jar # замените на фактическое имя вашей библиотеки

sources = $(wildcard *.java) # все .java файлы
classes = $(sources:.java=.class)

.PHONY: clean jar run-jar

all: program

program: $(classes)

clean:
    rm -f *.class lab1.jar

%.class: %.java
    $(JAVAC) -cp $(LIBS) $<

jar: $(classes)
    echo "Main-Class: Main" > MANIFEST.mf 
    jar -cvfm lab1.jar MANIFEST.mf $(classes)

run-jar: jar
    $(JAVA) -cp $(LIBS):lab1.jar Main 
