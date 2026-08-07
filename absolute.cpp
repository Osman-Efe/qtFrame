#include "numberGenerator.h"
#include "minimum.h"
#include "maximum.h"
#include <QList>

int calculateAbsolute(const QList<int>& numbers){
    int abs = calculateMaximum(numbers) - calculateMinimum(numbers);

    return abs;
}

//
