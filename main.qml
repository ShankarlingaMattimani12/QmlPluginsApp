import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.12
import com.mycompany.WhatsApp 1.0
import com.mycompany.Instagram 1.0
import com.mycompany.FaceBook 1.0
import com.mycompany.qmlcomponents 1.0
// Window {
//     width: 640
//     height: 480
//     visible: true
//     title: qsTr("Hello World")
//     StackView
//     {
//         id: _stack

//     }

//     GridView {
//             id: gridView
//             width: parent.width
//             height: parent.height
//             cellWidth: 150
//             cellHeight: 150
//             model: appModel
//             delegate: Item {
//                 width: gridView.cellWidth
//                 height: gridView.cellHeight

//                 Column {
//                     anchors.centerIn: parent
//                     spacing: 10

//                     Image {
//                         id : iconId
//                         source: model.icon
//                         width: gridView.cellWidth
//                         height: 75
//                         fillMode: Image.PreserveAspectFit
//                         MouseArea {
//                             anchors.fill: parent
//                             onClicked: {
//                                 console.log("Clicked: "+ model.appName)
//                                 if (model.appName === "camera") {

//                                                                         _stack.push("qrc:/ChromeItem.qml")
//                                                                     }
//                                 else {
//                                                                     console.log("Clicked: " + model.appName)
//                                                                 }

//                             }
//                         }
//                     }

//                     Text {
//                         text: model.appName
//                         font.pixelSize: 14
//                         color: "black"
//                         anchors.horizontalCenter: iconId.horizontalCenter
//                     }
//                 }
//             }
//         }
// }
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12

Window {
    width: 960
    height: 600
    visible: true
    title: qsTr("App Categories Filter")

    // The Wrapper object should be registered to QML from C++ as a context property or QML type
    // Example from C++:
    // engine.rootContext()->setContextProperty("wrapper", wrapperInstance);

    RowLayout {
        anchors.fill: parent

        // Left 25%: Category Buttons
        ColumnLayout {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.25
            spacing: 10
            //padding: 10

            Label {
                text: "Categories"
                font.bold: true
                font.pixelSize: 18
            }

            Button {
                text: "Production"
                Layout.fillWidth: true
                onClicked: wrapper.setCategoryFilter("Production")
            }

            Button {
                text: "Setup"
                Layout.fillWidth: true
                onClicked: wrapper.setCategoryFilter("Setup")
            }

            Button {
                text: "Settings"
                Layout.fillWidth: true
                onClicked: wrapper.setCategoryFilter("Settings")
            }

            Button {
                text: "Maintenance"
                Layout.fillWidth: true
                onClicked: wrapper.setCategoryFilter("Maintenance")
            }

            // Optional: show "All"
            Button {
                text: "All"
                Layout.fillWidth: true
                onClicked: wrapper.setCategoryFilter("")
            }
        }

        // Right 75%: Filtered Apps Grid
        GridView {
            id: gridView
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.75
            cellWidth: 150
            cellHeight: 150
            model: wrapper.filteredAppModel
            clip: true

            delegate: Item {
                width: gridView.cellWidth
                height: gridView.cellHeight

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Image {
                        id: iconId
                        source: model.icon
                        width: gridView.cellWidth
                        height: 75
                        fillMode: Image.PreserveAspectFit
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Clicked App:", model.appName)
                            }
                        }
                    }

                    Text {
                        text: model.appName
                        font.pixelSize: 14
                        color: "black"
                        anchors.horizontalCenter: iconId.horizontalCenter
                    }
                }
            }
        }
    }
}
