// ask for a person's name, and greet the person
#include <iostream>
#include <string>

int main()
{
	// ask for the person's name
	std::cout << "Please enter your first name: ";

	// read the name
	std::string name;     // define `name'
	std::cin >> name;     // read into `name'

    typedef int da;
    da nummer = 1;

    int x;
    int x = 5, y, z = 3;
    const int x, y = 0;
    const int& x = y;

	// write a greeting
	std::cout << "Hello, " << name  << "!" << std::endl;
	return 0;
}