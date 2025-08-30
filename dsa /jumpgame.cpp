// User function Template for C++

class Solution {
  public:
    // Function to check if we can reach the last index from 0th index.
    bool canReach(vector<int> &arr) {
        // code here
        int maxi = 0;
        int i = 0;
        while(i <= maxi && i < arr.size()){
            maxi = max(maxi, arr[i]+i);
            i++;
        }
        if(maxi >= arr.size()-1){
            return true;
        }
        return false;
        
    }
};


// 0 1 2 3 4 5
// 1 3 2 6 4 5














