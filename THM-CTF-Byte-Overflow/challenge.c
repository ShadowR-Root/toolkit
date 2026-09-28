#include <stdio.h>

void win(void)
{
    FILE *file = fopen("/opt/byte-overflow/flag.txt", "r");
    char flag[100];

    if (file == NULL)
    {
        puts("Flag file missing!");
        return;
    }

    fgets(flag, sizeof(flag), file);
    printf("Congratulations! %s\n", flag);

    fclose(file);
}

void vuln(void)
{
    char name[32];

    puts("Enter your name:");
    gets(name);

    puts("Thanks!");
}

int main(void)
{
    vuln();
    return 0;
}
