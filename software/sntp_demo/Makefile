all: sntp

sntp: sntp.c
	gcc -o sntp -Wall -Wpedantic -g sntp.c

test: sntp
	./sntp

clean:
	rm -fv sntp
