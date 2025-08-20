#include "AppListModel.h"
#include "Wrapper.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    AppListModel* appModel = new AppListModel;

    QQmlApplicationEngine engine;
    Wrapper wrapper;


    // Expose wrapper to QML
    engine.rootContext()->setContextProperty("wrapper", &wrapper);
    engine.rootContext()->setContextProperty("appModel",appModel);
    engine.addImportPath(QCoreApplication::applicationDirPath() +"/../../Plugins_build");
    CategoriesModel categoriesModel;
    engine.rootContext()->setContextProperty("categoriesModel", &categoriesModel);


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
