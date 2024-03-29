#include <stdio.h>
#include <string.h>


extern size_t _strlen(const char *str);

int main() {
    char *test1 = "";
    char *test2 = "A";
    char *test3 = "Hello";
    char *test4 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    char *test5 = "Special characters: @#$%^&*()";
    char *test6 = "1234567890";
    char *test7 = "This is a test string with numbers: 1234567890";
    
    char *tests[] = {test1, test2, test3, test4, test5, test6, test7};
    int NumTests = sizeof(tests) / sizeof(tests[0]);
    
    for (int i = 0; i < NumTests; i++) {
        size_t _strlenSize = _strlen(tests[i]);
        size_t strlenSize = strlen(tests[i]);
        
        if (_strlenSize == strlenSize) {
           printf("TEST N%d PASSED\n", i);
        } else {
            printf("TEST N%d FAILED\n\tTest case:\n\t\tTestCase: %s\n", i, tests[i]);
        }
    }
    
    return 0;
}
