#ifndef LOGGER_H
#define LOGGER_H
#include <QString>
#include <QList>

class Logger {
    public:
    static void logInfo(const QString& message, int value);
    static void logInfo(const QString& message, double value);

    //listeleri yazdırmak için
    static void logList(const QString& message, const QList<int>& list);
};

#endif // LOGGER_H
