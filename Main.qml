import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Basic


ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 200
    minimumHeight: 250
    visible: true
    title: qsTr("Home Page")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light // işletim sisteminden tema bilgisi seçip (aydınlık/karanlık) sistem temasının aydınlık olup olmadığını sorgular
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    GridLayout {
        id: grid
        columns: width < 400 ? 1 : 2 // pencere genişliği 400 pikselden küçükse elemanları alt-alta , büyükse yan-yana dizer
        rowSpacing: 0 // dikey boşluk
        columnSpacing: 0 // yatay boşluk
        anchors.fill: parent // ızgara düzeninin tüm sayfaya kaplamasını sağlar

        Rectangle {
            id: rectangle1
            color: window.lightMode ? window.reallyLight : window.reallyDark
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                Label {
                    id: text1
                    color: window.lightMode ? window.dark : window.light
                    font.pixelSize: 120
                    fontSizeMode: Text.Fit
                    text: qsTr("Welcome")
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Behavior on color {

                        ColorAnimation {
                            duration: 300
                            easing.type: "InQuart";
                        }
                    }
                }
            }

            Behavior on color {

                ColorAnimation {
                    duration: 200
                }
            }
        }

        Rectangle {
            id: rectangle2
            color: window.lightMode ? window.light : window.dark
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                Button {
                    id: button
                    text: qsTr("\u2192  Login")
                    // DÜZELTME: AlignBottom kaldırıldı. Sadece yatayda ortaladık.
                    Layout.alignment: Qt.AlignHCenter

                    // Tasarım uyumu için yazı rengi özelleştirmesi
                    contentItem: Text {
                        text: button.text
                        color: window.lightMode ? window.dark : window.light
                        font: button.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        Behavior on color { ColorAnimation { duration: 300 } }
                        }

                    // Tasarım uyumu için arka plan özelleştirmesi
                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 36
                        radius: 8
                        color: window.lightMode ? window.light : window.dark
                        border.color: window.lightMode ? window.dark : window.light
                        border.width: 1
                        Behavior on color { ColorAnimation { duration: 300 } }
                    }

                    onClicked:loginWindow.show()
                    }

                }
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }

            }
        }

    Window {
            id: loginWindow
            width: 640
            height: 480
            title: qsTr("Calculate")
            visible: false
            color: window.lightMode ? window.reallyLight : window.reallyDark


            Column {
                    anchors.centerIn: parent
                    spacing: 15
                    width: parent.width - 40 // Kenarlardan taşmayı önler

                    Label {
                        id: text2
                        font.pixelSize: 24
                        text: qsTr("Let's generate numbers")
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: window.lightMode ? "#000000" : "#FFFFFF"
                    }

                    // Sayıların basılacağı alan
                    Text {
                        id: lblNumbers
                        text: qsTr("Numbers: -")
                        font.pixelSize: 16
                        wrapMode: Text.WordWrap
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        color: window.lightMode ? "#000000" : "#FFFFFF"
                    }

                    // İstatistik Alanları
                    Text {
                        id: lblMax
                        text: qsTr("Max Value: -")
                        font.pixelSize: 14
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: window.lightMode ? "#000000" : "#FFFFFF"
                    }

                    Text {
                        id: lblMin
                        text: qsTr("Min Value: -")
                        font.pixelSize: 14
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: window.lightMode ? "#000000" : "#FFFFFF"
                    }

                    Text {
                        id: lblAverage
                        text: qsTr("Average: -")
                        font.pixelSize: 14
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: window.lightMode ? "#000000" : "#FFFFFF"
                    }

                    Text {
                        id: lblAbs
                        text: qsTr("Difference: -")
                        font.pixelSize: 14
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: window.lightMode ? "#000000" : "#FFFFFF"
                    }

                    // Sayı Üretme Butonu
                    Button {
                        id: generate
                        text: qsTr(" ♻ generate numbers")
                        anchors.horizontalCenter: parent.horizontalCenter

                        background: Rectangle {
                            implicitHeight: 36
                            implicitWidth: 160
                            radius: 8
                            color: window.lightMode ? window.light : window.dark
                            border.color: "#000000"
                            border.width: 2
                        }

                        onClicked: {
                            // C++ fonksiyonunu çağırıp gelen veriyi atıyoruz
                            var result = myNativeBackend.runAnalysisDirect(20);

                            lblNumbers.text = qsTr("Numbers: ") + result.numbers;
                            lblMax.text = qsTr("Max Value: ") + result.max;
                            lblMin.text = qsTr("Min Value: ") + result.min;
                            lblAverage.text = qsTr("Average: ") + result.average;
                            lblAbs.text = qsTr("Difference: ") + result.absDiff;
                        }
                    }
                }




        }
    }
