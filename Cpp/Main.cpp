#include <iostream>
#include <string> 
#include <cstring>

using namespace std;


void testAll();
void greet();
void encrypt_and_print();
void decrypt_and_print();
int get_user_choice();

int main()
{

    testAll();
    
    return 0 ;
}

void greet()
{
    cout << "Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2] ?" << "\n";
}

int get_user_choice()
{
    int choice;
    cout << "Do you wish to Encrypt[1] or Decrypt[2]? ";
    cin >> choice;
    cout << "Choice: " << choice << endl;

    return choice;
}

void encrypt_and_print(const char *input)
{

   const unsigned int  exclusive = 0x73113777;
    unsigned int result2;
    cout<<"The cipher text is: ";
    for (int i = 0; input[i] != '\0'; i++)
    {
        char c = input[i];
       unsigned int result = (c << 4);
      result2 = result ^ exclusive;
       cout << result2<<" ";
    }

    cout<< endl;
}

void decrypt_and_print(int num1 , int num2 , int num3 , int num4 )
{
    //i.e reverse encryption WE SHOULD GET CHAR variables FOR EACH NUMBER
    const unsigned int exclusive = 0x73113777;

    unsigned int result1 = num1 ^exclusive;
    unsigned int result2 = num2 ^ exclusive;
    unsigned int result3 = num3 ^ exclusive;
    unsigned int result4 = num4 ^exclusive;

    char c1 = (result1 >> 4) & 0xFF;
    char c2 = (result2 >> 4) & 0xFF;
    char c3 = (result3 >> 4) & 0xFF;
    char c4 = (result4 >> 4) & 0xFF;
    cout << "The plaintext is: " << c1 << c2 << c3 << c4 << endl;


}

void testAll()
{
     greet();
    int choice =  get_user_choice();
    if(choice == 1 )
    {
        cout<<"Enter the plaintext to encrypt: ";
        string input;
        cin.ignore(); 
        getline(cin, input);
        
        int size = input.length() + 1; 
        char* plaintext = new char[size];
        strcpy(plaintext, input.c_str());//copy

        encrypt_and_print(plaintext);//encrypt
    }
    else if(choice == 2)
    {
        int num1 , num2 , num3 , num4 ;
        cout << "Enter cipher text to decrypt: " << endl;
        cin>> num1>> num2 >> num3 >> num4;
        decrypt_and_print(num1,num2,num3,num4);

    }
    else
    {
        cout<< "INVALID INPUT! "<<endl;
    }
    


}