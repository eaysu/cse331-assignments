#include <stdio.h>

int main () {
    int i = 0,
        j = 0,
        k = 0,
        size = 0,
        index = 0;
    int arr[100];

    printf("array size: ");
    scanf("%d", &size);

    for (i = 0;i < size;++i) {
        scanf("%d", &index);
        arr[i] = index;
    }

    printf("k: ");
    scanf("%d", &k);

    for (i = 0;i < size;++i) {
        for (j = i + 1;j < size;++j) {
            if((arr[i] + arr[j]) % k == 0) {
                printf("(%d, %d)\n", arr[i], arr[j]);
            }
            else { continue; }
        }
    }

    return 0;
}