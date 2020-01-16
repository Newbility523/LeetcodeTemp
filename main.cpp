#include<iostream>

using namespace std;

class Solution {
public:
    string longestPalindrome(string s) {
        int l = 0;
        int r = 0;
        int maxSame = 0;
        int length = s.length();
        while (l < length)
        {
            if (l - 1 > 0 && r + 1 < length)
            {
                if (s[l - 1] == s[r + 1])
                {
                    l -= 1;
                    r += 1;
                }
            }
        }

        string result = s.substr(l, r - l + 1);
        return result;
    }
};

int main()
{
    //for (int i = 0; i < 10; ++i)
    //{
    //    std::cout << "hello world" << std::endl;
    //}
    string s = "aabbccefg";
    Solution solution = Solution();
    string result = solution.longestPalindrome(s);
    std::cout << result << std::endl;

    return 0;
}
