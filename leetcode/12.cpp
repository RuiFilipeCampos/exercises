#include <iostream>

#define I 1

#define IV 4
#define V 5

#define IX 9
#define X 10

#define XL 40
#define L 50

#define XC 90
#define C 100

#define CD 400
#define D 500

#define CM 900
#define M 1000


#define WHILE_CASE(CASE) do { \
    while (num >= CASE){ \
        num -= CASE; \
        roman += #CASE; \
    } \
} while(false) 

#define IF_CASE(CASE) do { \
    if (num >= CASE){ \
        num -= CASE; \
        roman += #CASE; \
    } \
} while(false)
    
class Solution {
public:
    string intToRoman(int num) {
        string roman = "";
        
        WHILE_CASE(M);
        IF_CASE(CM);
        
        WHILE_CASE(D);
        IF_CASE(CD);
        
        WHILE_CASE(C);
        IF_CASE(XC);

        WHILE_CASE(L);
        IF_CASE(XL);

        WHILE_CASE(X);
        IF_CASE(IX);
        
        WHILE_CASE(V);
        IF_CASE(IV);

        WHILE_CASE(I);

        return roman;
        
        
    }
};