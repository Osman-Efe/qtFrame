#include <QRandomGenerator>
#include <QStringList>
#include <QList>
#include <QDebug>
#include "numberGenerator.h"

QList<int> generateNumber(int length){
    QList<int> uniqueNumber;

    while(uniqueNumber.size()<length){
        int boundedInt = QRandomGenerator::global()->bounded(1, 101);
        if (!uniqueNumber.contains(boundedInt)){
            uniqueNumber.append(boundedInt);
        }
    }

    return uniqueNumber;


}
