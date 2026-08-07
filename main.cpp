#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> //
#include "nativeBridge.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // 1. C++ nesnesini burada oluşturuyoruz
    NativeBridge bridgeObject;

    // 2. QML yüklenmeden ÖNCE rootContext'e "myNativeBackend" ismiyle bağlıyoruz
    engine.rootContext()->setContextProperty("myNativeBackend", &bridgeObject);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("qtFrame", "Main");

    return QGuiApplication::exec();
}

