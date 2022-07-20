import QtQuick 2.0

Item {
    anchors.fill: parent
    //круг
    Image{
        id: body
        source: "images/widget/body.png"
        anchors.centerIn: parent
        width: 250
        height: 250
    }
    //поле с цифрами
    Image{

        id: brder
        source: "images/widget/border.png"
        anchors.horizontalCenter: body.horizontalCenter
        y: body.y+body.height/2-30
        height: 76
        width: 250
    }
    //Прямоугольник, в котором содержатся столбцы с цифрами
    Rectangle{
        anchors.centerIn: brder
        color: "transparent"
        //чтобы была видна только одна цифра из столбца
        clip: true
        width: 36*3
        height: 52
        //1
        Digit{
            id: _1
            digit: 1
            x: 15
            y: -399
        }
        //0
        Digit{
            id: _0_1
            x: _1.width+5
            y: -399
        }
        //0
        Digit{
            id: _0_2
            x: _1.width+_0_2.width
            y: -399
        }
    }
    //огни на круге
    Widget_lights{
        id: lights
        anchors.fill: body
    }

    SequentialAnimation{
        id: anim
        ParallelAnimation{
            //движение цифр
            NumberAnimation {target: _1; property: "y"; from: -399; to: 7; duration: 1000}
            NumberAnimation {loops: 2; target: _0_1; property: "y"; from: -399; to: 7; duration: 1000}
            NumberAnimation {loops: 3; target: _0_2; property: "y"; from: -399; to: 7; duration: 1000}
        }
        ParallelAnimation{
            //увеличение поля с цифрами
            NumberAnimation { target: brder; property: "width"; to: 255; duration: 40; easing.type: "OutQuad"}
            NumberAnimation { target: brder; property: "height"; to: 87; duration: 40; easing.type: "OutQuad"}
            //увеличение цифр
            PropertyAnimation{ target: _1; property: "sz"; to: 52; duration: 40; easing.type: "OutQuad"}
            NumberAnimation {target: _1; property: "x"; to: _1.x-7; duration: 40}
            PropertyAnimation{target: _0_1; property: "sz"; to: 52; duration: 40; easing.type: "OutQuad"}
            PropertyAnimation{target: _0_2; property: "sz"; to: 52; duration: 40; easing.type: "OutQuad"}
            NumberAnimation {target: _0_2; property: "x"; to: _0_2.x+7; duration: 40}
        }
        ParallelAnimation{
            //уменьшение поля с цифрами
            NumberAnimation {target: brder; property: "width"; to: 250; duration: 20; easing.type: "OutQuad"}
            NumberAnimation {target: brder; property: "height"; to: 70; duration: 20; easing.type: "OutQuad"}
            //уменьшение цифр
            PropertyAnimation{target: _1; property: "sz"; to: 38; duration: 20; easing.type: "OutQuad"}
            NumberAnimation {target: _1; property: "x"; to: _1.x; duration: 20}
            PropertyAnimation{target: _0_1; property: "sz"; to: 38; duration: 20; easing.type: "OutQuad"}
            PropertyAnimation{target: _0_2; property: "sz"; to: 38; duration: 20; easing.type: "OutQuad"}
            NumberAnimation {target: _0_2; property: "x"; to: _0_2.x; duration: 20}
        }
    }

    Component.onCompleted: {
        lights.animate_lights()
        anim.running=true
    }
}
