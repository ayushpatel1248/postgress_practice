class Solution {
  public:
    void check(string s, int l, int r, int &count){
        while(l >= 0 && r <= s.size()-1){
            if(s[l] == s[r]){
                if(r-l > 0) count++;
                l--;
                r++;
            }
            else break;
        }
    }
    int countPS(string &s) {
        // code here
        int count = 0;
        for(int i = 0; i <s.size(); i++){
            check(s, i, i+1, count);
            check(s, i, i, count);
        }
        return count;
    }
};