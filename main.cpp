#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QQmlContext>
#include <QDebug>
#include "src/climatebackend.h".h"
#include "src/vehiclebackend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    VehicleBackend vehiclebackend;
    ClimateBackend climateBackend;

    // 1. Lấy đường dẫn font (Đảm bảo đường dẫn này đúng trong resource qrc)
    // Nếu bạn đang loadFromModule("HMI_Car", "Main"), prefix mặc định thường là URI
    QString fontPath = ":/HMI_Car/fonts/MaterialSymbolsOutlined.ttf";

    // 2. Load font và lấy Font Family thực sự
    int fontId = QFontDatabase::addApplicationFont(fontPath);
    QString loadedFontFamily = "";

    if (fontId == -1) {
        qWarning() << "⚠️⚠️ LỖI NGHIÊM TRỌNG: Không load được font ở đường dẫn:" << fontPath;
        qWarning() << "⚠️ Hãy kiểm tra lại file fonts/MaterialSymbolsOutlined.ttf có tồn tại không?";
    } else {
        // Lấy tên family chính xác của font vừa load (trong file image_6 nó là Material Symbols Outlined Thin)
        loadedFontFamily = QFontDatabase::applicationFontFamilies(fontId).at(0);
        qDebug() << "✅✅ Đã load font icon thành công! Tên Family Qt tìm được là:" << loadedFontFamily;
    }

    QQmlApplicationEngine engine;

    // 3. ÉP BUỘC C++ EXPOSE TÊN FONT CHO QML DÙNG
    // Trong QML, bạn sẽ dùng biến materialIconFontFamily Name này để lấy tên font
    engine.rootContext()->setContextProperty("ClimateAPI", &climateBackend);
    engine.rootContext()->setContextProperty("materialIconFontFamilyName", loadedFontFamily);
    engine.rootContext()->setContextProperty("Backend", &vehiclebackend);


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.loadFromModule("HMI_Car", "Main");

    return app.exec();
}
