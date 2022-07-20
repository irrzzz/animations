import QtQuick 2.0

Item {
    width: 40
    height: 40
    //черный кубик
    Image{
        id: black
        x:7
        y: 12
        width:21
        height: 20
        source: "images/dices/black_dice.png"
    }
    //красный кубик
    Image{
        id: red
        x:14
        y: 9
        width:20
        height: 20
        source: "images/dices/red_dice.png"
    }

    SequentialAnimation{
        id: dices_move
        //красный вверх
        NumberAnimation {target: red; property: "y"; to:red.y-4; duration: 200}
        ParallelAnimation{
            //красный вниз, черный вверх
            NumberAnimation {target: black; property: "y"; to: black.y-4; duration: 200}
            NumberAnimation {target: red; property: "y"; to:red.y; duration: 200}
        }
        //черный вниз
        NumberAnimation {target: black; property: "y"; to:black.y; duration: 200}
    }

    MouseArea{
        anchors.fill: parent
        onClicked: dices_move.running=true
    }
}
