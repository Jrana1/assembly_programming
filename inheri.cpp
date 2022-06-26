#include <iostream>
using namespace std;
class B
{
private:
    int b;

public:
    B() { cout << "base" << endl; }
    int getB() { return b; }
};

class D : protected B
{
private:
    int d;

public:
    D() { cout << "derived" << endl; }
    void print()
    {
        cout << getB() << endl;
        b++;
    }
};
class C : private D
{
private:
    int c;

public:
    C() { cout << "derived" << endl; }
    void print()
    {
        cout << getB() << endl;
    }
};
int main()
{

    return 0;
}