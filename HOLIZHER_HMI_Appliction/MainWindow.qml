// import QtQuick 2.15
// import QtQuick.Layouts
// import QtQuick.Controls
// import com.example.wrapper 1.0

// Item {
//     id:root
//     anchors.fill: parent

//     Wrapper{
//         id:wrapper
//     }

//     RowLayout{
//         anchors.fill: parent

//         GridView {
//             Layout.fillHeight: true
//             Layout.fillWidth: true
//             cellWidth: 100
//             cellHeight: 100
//             model:wrapper.appsFilterModel
//             delegate: Rectangle {
//                 width: 80
//                 height: 80
//                 color: color
//                 border.color: "black"
//                 radius: 8

//                 Text {
//                     id:appText
//                     anchors.centerIn: parent
//                     text: appName
//                     color: "red"
//                 }
//             }
//         }

//         ListView{
//             Layout.preferredWidth:200
//             Layout.fillHeight: true
//             model: wrapper.categoryViewModel

//             orientation: ListView.Vertical
//             delegate:Rectangle {
//                 width: 80
//                 height: 80
//                 color: color
//                 border.color: "black"
//                 radius: 8


//                 Text {
//                     id:categoryText
//                     anchors.centerIn: parent
//                     text: category
//                     color: "red"
//                 }
//                 MouseArea{
//                     anchors.fill: parent
//                     onClicked: wrapper.appsFilterModel.setCategoryFilter(categoryText.text)
//                 }

//             }
//         }
//     }
// }


import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import com.example.wrapper 1.0
import com.pthinks.contactsPlugin 1.0

Item {
    id: root
    anchors.fill: parent

    Wrapper {
        id: wrapper
    }

    RowLayout {
        anchors.fill: parent

        // GridView - takes 80% width
        GridView {
            id: gridView
            Layout.preferredWidth: parent.width * 0.8
            Layout.fillHeight: true

            model: wrapper.appsFilterModel

            // Calculate 3 items per row
            cellWidth: width / 3
            cellHeight: cellWidth // Make cells square

            delegate: Rectangle {
                width: gridView.cellWidth * 0.9
                height: gridView.cellHeight * 0.9
                color: "orange"
                radius: 8
                border.color: "black"

                Column {
                    anchors.centerIn: parent
                    spacing: 8

                    Image {
                        source: icon
                        width: parent.width * 0.6
                        height: width
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        text: appName
                        color: "white"
                        font.pixelSize: 14
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.WordWrap
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }

        // ListView - takes 20% width
        ListView {
            id: listView
            Layout.preferredWidth: parent.width * 0.2
            Layout.fillHeight: true
            orientation: ListView.Vertical
            model: wrapper.categoryViewModel

            delegate: Rectangle {
                width: listView.width * 0.9
                height: 50
                radius: 5
                color: "#f0f0f0"
                border.color: "#888888"
                // anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 5

                Text {
                    id: categoryText
                    anchors.centerIn: parent
                    text: category
                    color: "#333"
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: wrapper.appsFilterModel.setCategoryFilter(categoryText.text)
                }
            }
        }
    }
}
