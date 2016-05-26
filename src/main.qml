import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0

ApplicationWindow {
  visible: true
  title: "Some kind of chat app"
  width: 300
  height: 500

  ColumnLayout {
    anchors.fill:parent

    TextArea{
      id: chatArea
      Layout.fillWidth: true
      Layout.fillHeight: true
      readOnly: true
      textFormat: TextEdit.AutoText
    }

    TextField{
      id: msgField
      focus: true
      Layout.fillWidth: true

      onAccepted: sendMsg()
    }

    Button{
      text: "Send"
      Layout.alignment: Qt.AlignRight

      onClicked: sendMsg()
    }
  }

  function sendMsg() {
    chat.send_msg(msgField.text);
    msgField.text = ""
    chatArea.text = chat.get_history()  // TODO append return of send_msg
  }
}

