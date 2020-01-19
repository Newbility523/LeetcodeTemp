#include<iostream>

using namespace std;

class Solution {
public:
    string longestPalindrome(string s) {
        int startL = 0;
        int startR = 0;

        int maxLenght = 1;
        int resultL = startL;
        int length = s.length();

        int saveCountMax = 100000;
        int count = 0;
        while (startL < length)
        {
            int l = startL;
            int r = startR;
            bool hasSame = false;
            while (true)
            {
                if (s[l] == s[r])
                {
                    if (l - 1 >= 0 && r + 1 < length)
                    {
                        --l;
                        ++r;
                    }
                    else
                    {
                        break;
                    }
                }
                else
                {
                    ++l;
                    --r;
                    break;
                }
            }

            int curLength = r - l + 1;
            if (curLength > maxLenght)
            {
                maxLenght = curLength;
                resultL = l;
            }

            if (startL == startR)
            {
                startR += 1;
            }
            else
            {
                startL += 1;
            }

            count += 1;
            if (count > saveCountMax)
            {
                std::cout << "dead loop maybe !" << std::endl;
                break;
            }
        }

        string result = s.substr(resultL, maxLenght);
        return result;
    }
};

int main()
{
    //for (int i = 0; i < 10; ++i)
    //{
    //    std::cout << "hello world" << std::endl;
    //}
    string s = "abcdefg";
    Solution solution = Solution();
    string result = solution.longestPalindrome(s);
    std::cout << result << std::endl;

    //std::cout << "hello world" << std::endl;
    return 0;
}
