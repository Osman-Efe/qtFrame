#include "numberGenerator.h"
#include <QList>

int calculateMaximum(const QList<int>& numbers){
    if(numbers.isEmpty()){
        return -1;
    }

    int max = numbers.first();

    for(int num: numbers){
        if(num > max){
            max = num;
        }
    }

    return max;
}