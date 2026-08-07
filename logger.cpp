#include "logger.h"
#include <QDebug>
#include <QDateTime>

QString getTimeStamp(){
    return QDateTime::currentDateTime().toString("[yyyy-MM-dd HH:mm:ss] ");
}

void Logger::logInfo(const QString& message, int value){
    qDebug().noquote() << getTimeStamp() << message << value;
}

void Logger::logInfo(const QString& message, double value){
    qDebug().noquote() << getTimeStamp() << message << value;
}

void Logger::logList(const QString& message, const QList<int>& list){
    qDebug().noquote() << getTimeStamp() << message << list;
}