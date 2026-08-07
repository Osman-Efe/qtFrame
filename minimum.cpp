#include "numberGenerator.h"
#include <QList>

int calculateMinimum(const QList<int>& numbers){
    if(numbers.isEmpty()){
        return -1;
    }

    int min = numbers.first();

    for(int num: numbers){
        if(num < min){
            min = num;
        }
    }

    return min;
}