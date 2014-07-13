import QtQuick 2.0

Item {
    height: 37
    property string shadowPressedColor
    property string shadowReleasedColor
    property string pressedColor
    property string releasedColor
    property string icon: ""
    property string textColor: "#FFFFFF"
    property alias text: label.text
    signal clicked()

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height - 1
        y: buttonArea.pressed ? 0 : 1
        radius: 4
        color: buttonArea.pressed ? parent.shadowPressedColor : parent.shadowReleasedColor
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height - 1
        y: buttonArea.pressed ? 1 : 0
        color: buttonArea.pressed ? parent.pressedColor : parent.releasedColor
        radius: 4
    }

    Text {
        id: label
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
        font.family: "Arial"
        font.bold: true
        font.letterSpacing: -1
        font.pixelSize: 12
        color: parent.textColor
        visible: parent.icon === ""
    }

    Image {
        anchors.centerIn: parent
        visible: parent.icon !== ""
        source: parent.icon
    }

    MouseArea {
        id: buttonArea
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}