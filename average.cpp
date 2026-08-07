#include "numberGenerator.h"
#include <QList>

int calculateAverage(const QList<int>& numbers){
    if(numbers.isEmpty()){
        return 0.0;
    }

    double total = 0.0;

    for(int num: numbers){
        total += num;
    }

    return total/numbers.size();
}

