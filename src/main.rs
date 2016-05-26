#[macro_use]
extern crate qmlrs;

truct Chat {
  history: String
}

impl Chat {
  fn new() -> Chat {
    Chat { history: String::new() }
  }

  fn send_msg(&mut self, msg: String) -> String {
    let msg = format!("<b>you:</b> {} <br />", msg);
    self.history.push_str(msg.as_str());
    msg
  }

  // workaround because qmlrs doesn't support properties yet
  fn get_history(&self) -> &str {
    self.history.as_str()
  }
}

Q_OBJECT! { Chat:
  slot fn send_msg(String);
  slot fn get_history();  // workaround because no properties
}

fn main() {
  let mut engine = qmlrs::Engine::new();

  engine.set_property("chat", Chat::new());
  engine.load_local_file("main.qml");
  engine.exec();
}

