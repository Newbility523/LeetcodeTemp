// test.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <math.h>
#include <string>

using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

void OutputList(ListNode* head, string msg)
{
    cout << msg << endl;
    ListNode* temp = head;
    while (temp != NULL)
    {
        cout << temp->val << endl;
        temp = temp->next;
    }
}

void OutputIntList(vector<int> list, string msg)
{
    cout << msg << endl;
    for (int i = 0; i < list.size(); ++i)
    {
        cout << list[i] << endl;
    }
}
 
class Solution {
public:

    //[1, 1, 2]
    int removeDuplicates(vector<int>& nums) {
        int len = nums.size();
        int result = 0;
        for (int i = 1; i < len; ++i)
        {
            if (nums[i] != nums[result])
            {
                ++result;
                nums[result] == nums[i];
            }
        }

        return result + 1;
    }

    int removeElement(vector<int>& nums, int val) {
        int len = nums.size();
        /*if (len <= 0)
        {
            return 0;
        }*/

        int cur = 0;
        for (int i = 0; i < len; ++i)
        {
            if (nums[i] != val)
            {
                nums[cur] = nums[i];
                ++cur;
            }
        }

        return cur;
    }

    //"m issi ssippi"
    //"issi p"
    int strStr(string haystack, string needle) {
        if (needle == "")
        {
            return 0;
        }

        int len = needle.length();
        vector<int> next(len, 0);
        int count = 0;

        for (int i = 0; i < len;)
        {
            count = 0;
            for (int j = 0; j < len; ++j)
            {
                if (i != 0 && needle[i] == needle[j])
                {
                    ++count;
                    next[i] = count;
                    ++i;
                }
                else
                {
                    i = count == 0 ? i + 1 : i;
                    break;
                }
            }
        }

        OutputIntList(next, "next list");



       /* int lenFind = needle.length();
        for (int i = 0; i < len - lenFind + 1; )
        {
            int j = 0;
            while (j < lenFind)
            {
                if (haystack[i + j] != needle[j])
                {
                    break;
                }

                ++j;
            }

            if (j == lenFind)
            {
                return i;
            }
            else
            {
                i = j == 0 ? i + 1 : i + j;
            }
        }*/

        return -1;
    }
};

int main()
{
    //ListNode* p1 = new ListNode(0);
    //ListNode* cur = p1;
    //for (int i = 1; i < 5; ++i)
    //{
    //    cur->next = new ListNode(i);
    //    cur = cur->next;
    //}

    //OutputList(p1, "before");

    Solution s = Solution();
    //vector<int> p1{ 1, 2, 2 };
    string input = "hello";
    string find = "abcabcaaaaa";
    //int result = s.removeDuplicates(p1);
    int result = s.strStr(input, find);

    cout << result << endl;

    return 0;
}



// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
