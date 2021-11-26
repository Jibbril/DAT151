int id(int x) { return x; }

int main() {
  int z = 0;

  // Function calls
  id(++z); // 1
  printInt(z);  // 1
  id(z = z + 1); // 2
  printInt(z); // 2

  // Expressions
  z++ + z++; // 4
  printInt(z); // 4

  z++ == z++; // 6
  printInt(z); // 6

  // Conditions
  if (++z == 7) { printInt(z); } else { } // 7
  printInt(z); // 7

  if (z++ == 8) { } else { printInt(z); } // 8
  printInt(z); //8

  while (++z == 9) { printInt(z); } // 9
  printInt(z);

  while (z++ == 11) { }
  printInt(z);

  return 0;
}
