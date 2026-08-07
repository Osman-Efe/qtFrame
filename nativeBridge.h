#pragma once
#include <QObject>
#include <QVariantMap>
#include <QStringList>
#include <QList>
#include <QDebug>

#include "minimum.h"
#include "maximum.h"
#include "average.h"
#include "numberGenerator.h"
#include "absolute.h"
#include "logger.h"

class NativeBridge : public QObject {
    Q_OBJECT
    // QML_ELEMENT satırını buradan sildik
public:
    explicit NativeBridge(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE QVariantMap runAnalysisDirect(int count) {
        // Mevcut hesaplama kodlarınız aynen kalıyor...
        QList<int> numbers = generateNumber(count);

        int minVal = calculateMinimum(numbers);
        int maxVal = calculateMaximum(numbers);
        double ave = calculateAverage(numbers);
        int absVal = calculateAbsolute(numbers);

        QStringList strList;
        for(int num : numbers) {
            strList.append(QString::number(num));
        }

        QVariantMap results;
        results["numbers"] = strList.join(", ");
        results["min"] = minVal;
        results["max"] = maxVal;
        results["average"] = QString::number(ave, 'f', 2);
        results["absDiff"] = absVal;

        return results;
    }
};
