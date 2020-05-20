import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

import "qrc:/QtQuickBasic"

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("QML 示例")
    color: "#00ff00"

//    StackView{
//        id: stack
//        anchors.fill: parent
//        initialItem: rootPage
//    }

//    Component {
//        id: rootPage
//        Rectangle{
//            id: rootPageItem
//            signal onTableViewClicked()
//            TableView {
//                id: tableView
//                anchors.fill: parent
//                headerVisible: false

//                TableViewColumn {
//                    role: "content"
//                }
//                model: tableViewListModel
//            }

//            ListModel{
//                id: tableViewListModel
//                ListElement{
//                    content: qsTr("基础控件")
//                }
//            }
//            Connections {
//                target: tableView
//                onClicked: rootPageItem.onTableViewClicked()
//            }
//        }
//    }


//   Connections{
//       target: stack.initialItem
//       onTableViewClicked:{
//           console.log(qsTr("点击" + row))
//       }
//   }

//    Loader{
//        id: rootPageLoader
//        anchors.fill: parent
//        anchors.margins: 20
//        sourceComponent: rootPage
//    }

//    Connections{
//           target: rootPageLoader.item
//           onTableViewClicked:{
//               console.log(qsTr("点击" + row))
//           }
//       }

//    Component{
//        id: basic
//        Rectangle{
//            Row{
//                Column{
//                    Button{
//                        text: qsTr("back")
//                        onClicked: {
//                            stack.pop()
//                        }
//                    }

//                    Button{
//                        text: qsTr("push")
//                        onClicked: {
//                            stack.push(basic)
//                        }
//                    }
//                }



//                QtQuickBasic{

//                }
//            }


//        }
//    }

    Text {
            id:coloredText;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top:parent.top;
            anchors.topMargin: 4;
            text:"Hello World !";
            font.pixelSize: 32;
        }
    Component {
           id: colorComponent;
           Rectangle {
               id: colorPicker;
               width: 50;
               height: 30;
               signal colorPicked(color clr);
               MouseArea {
                   anchors.fill: parent;
                   onPressed: colorPicker.colorPicked(colorPicker.color);
               }
           }
       }
       Loader {
           id: redLoader;
           anchors.left: parent.left;
           anchors.leftMargin: 4;
           anchors.bottom: parent.bottom;
           anchors.bottomMargin: 4;
           sourceComponent: colorComponent;
           onLoaded: {
               item.color ="red";
           }
       }
       Loader {
           id: blueLoader;
           anchors.left: redLoader.right;
           anchors.leftMargin: 4;
           anchors.bottom: parent.bottom;
           anchors.bottomMargin: 4;
           sourceComponent: colorComponent;
           onLoaded: {
               item.color ="blue";
           }
       }
      Connections {
          target: redLoader.item;
          onColorPicked:{
              coloredText.color = clr;
          }
      }
      Connections {
          target: blueLoader.item;
          onColorPicked :{
              coloredText.color = clr;
          }
      }

}

