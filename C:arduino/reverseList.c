#include<stdio.h>

// This is a C program to reverse a string using pointers
//   i.e. we invert a string using pointers or w/o using 
//   the libr. fun. strrev.

int string_length(char*);
void reverse(char*);

main()
{
  char string[100];
  
  // Asking user to input a string to reverse
  printf("Enter a string of your choice:\n");
  gets(string);

  // Grabbed the argument and is reversing string
  reverse(string);
  printf("Reverse of entered string is \"%s\".\n", string);
  
  return 0;
}

// creating my own reverse method
void reverse(char *string)
{
  int length, c;
  char *head, *tail, temp;

  length = string_length(string);
  head = string;
  tail = string;

  for(c = 0; c < length -1; c++)
    tail++;

  for(c = 0; c < length/2; c++)
    {
      temp = *tail;
      *tail = *head;
      *head = temp;
      
      head++;
      tail--;
    }
}

int string_length(char *pointer)
{
  int c = 0;
  
  while(*(pointer+c) != '\0')
    c++;

  return c;
}
