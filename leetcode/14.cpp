

class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        
        string prefix =  strs[0];
        int prefix_size = prefix.length();
        int current_size;

        for (string current : strs){
            
            current_size = current.length();
            int i = 0;
            
            for (i; i < prefix_size && i < current_size; ++i){
                
                
                if (prefix[i] != current[i]) 
                    break;
                
            }
            
            if (i==0) return "";
            
            prefix = prefix.substr(0, i);
            prefix_size = i;
        }
        
        return prefix;
        
    }
};