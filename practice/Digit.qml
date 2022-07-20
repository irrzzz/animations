import QtQuick 2.0
import Qt5Compat.GraphicalEffects

//лента с цифрами для Widget
Rectangle {
    property int digit: 0
    //размер цифры
    property double sz: 38
    width: 36
    height: 544
    color: "transparent"
    Column{
        id: col
        anchors.fill: parent
        spacing: 22
        Repeater{
            model: 8
            Rectangle{
                width: 24
                height: 36
                color: "transparent"
                Text{
                    //сама цифра
                    id:text
                    text: digit
                    font.family: "Rockwell Extra Bold"
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.centerIn: parent
                    font.pointSize: sz
                    color: "black"
                }
                LinearGradient{
                    //заливка
                    id: gradient
                    anchors.fill: text
                    source: text
                    gradient: Gradient {
                        GradientStop { position: 0.1; color: "black" }
                        GradientStop { position: 0.4; color: "red" }
                        GradientStop { position: 1; color: "black" }
                    }
                }
            }

        }
    }
}
