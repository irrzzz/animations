import QtQuick 2.0

Item {
    width: 40
    height: 40
    //свечение монетки
    Image{
        id: oreol
        source: "images/jp_coin/coin_ore.png"
        anchors.centerIn: parent
        width: 38
        height: 38
    }
    //монетка
    Image{
        id: coin
        source: "images/jp_coin/coin.png"
        anchors.centerIn: parent
        width: 33
        height: 32
    }
    //блик
    Image{
        id: light
        source: "images/jp_coin/coin_light.png"
        anchors.centerIn: parent
        width: 42
        height: 32
    }

    ParallelAnimation{
        id: coin_moves
        //"поворот" монеты
        SequentialAnimation{
            NumberAnimation {target: coin; property: "width"; to: 12; duration: 300}
            NumberAnimation {target: coin; property: "width"; to: coin.width; duration: 10}
        }
        //"поворот" свечения
        SequentialAnimation{
            NumberAnimation {target: oreol; property: "width"; to: 20; duration: 300}
            NumberAnimation {target: oreol; property: "width"; to: oreol.width; duration: 10}}
        //исчезновение и появление блика
        SequentialAnimation{
            NumberAnimation {target: light; property: "opacity"; to: 0.0; duration: 300}
            NumberAnimation {target: light; property: "opacity"; to: 1.0; duration: 10}
        }
        //поворот блика
        SequentialAnimation{
            RotationAnimation {target: light; to: -30; duration: 600}
            RotationAnimation {target: light; to: 0; duration: 100}
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: coin_moves.running=true
    }
}


