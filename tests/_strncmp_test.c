#include <stdio.h>
#include <string.h>

extern int _strncmp(const char *str1, const char *str2, size_t size);

int main() {

    const char *str1[] = {"hello", "world", "abc", "xyz", "", "abcde", "apple", "banana", "cat", "dog",
                          "123", "456", "123456", "abcXYZ", "jello", "HeLLo", "h", "\ta2145(-|)\n", "longstring", "longstr", "M^pgrfù\np^kgt"};
    const char *str2[] = {"hello", "world", "abc", "xyz", "", "abcdef", "apple", "banana", "cat", "dog",
                          "123", "456", "123", "abcXYZ", "hello", "HELLO", "H", "\ta2145(-|)\n", "longstring", "longstr", "M^pgrfù\np^kgt"};

    int NumTests = sizeof(str1) / sizeof(str1[0]);

    for (int i = 0; i < NumTests; i++) {
        int ExcpectedValue = strncmp(str1[i], str2[i], strlen(str1[i]));
        int ResultValue = _strncmp(str1[i], str2[i], strlen(str1[i]));

        if (ResultValue == ExcpectedValue) {
            int ExcpectedValue2 = strncmp(str1[i], str2[i], strlen(str1[i]) - 1);
            int ResultValue2 = _strncmp(str1[i], str2[i], strlen(str1[i]) - 1);
            
            if (ResultValue2 == ExcpectedValue2) {
                printf("TEST N%d PASSED\n", i);
            } else {
                printf("TEST N%d FAILED\n\tTest case:\n\t\tTestCase1: %s, TestCase2: %s\n", i, str1[i], str2[i]);
            }
        } else {
            printf("TEST N%d FAILED\n\tTest case:\n\t\tTestCase1; %s, TestCase2, %s\n", i, str1[i], str2[i]);
        }
    }

    return 0;
}
