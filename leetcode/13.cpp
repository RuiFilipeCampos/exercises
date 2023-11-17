#include <iostream>

#include <vector>

#include <map>

using namespace std;


char to_char(string s) {
    return s[1];
}






class Solution {
    
    map<string, int> to_value = {
        {"I", 1},
        {"V", 5},
        {"X", 10},
        {"L", 50},
        {"C", 100},
        {"D", 500},
        {"M", 1000}
    };

public:

    int 
    romanToInt(string s) {
        
        int current_value = 0;

        int sum = 0;
        
        int previous_value = 0;

        for (char c : s){


            current_value =  this->to_value[     
                string(1, c)
            ];

            if (current_value > previous_value ){
                sum -= previous_value;
                sum += current_value - previous_value;
    
                previous_value = current_value;
                continue;
            }

            sum += current_value;
            previous_value = current_value;

    }

    return sum;
        
    }
};