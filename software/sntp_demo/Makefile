all: test_sntp

test_sntp: sntp.c test_sntp.c
	gcc -o test_sntp -Wall -Wpedantic sntp.c test_sntp.c

clean:
	rm -fv test_sntp
