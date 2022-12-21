use brightness_change::BrightnessChange;
use gtk::traits::{BoxExt, GtkWindowExt, RangeExt};
use gtk::EventControllerKey;
use relm4::{send, AppUpdate, Model, RelmApp, WidgetPlus, Widgets};

#[allow(dead_code)]
struct AppWidgets {
    window: gtk::ApplicationWindow,
    vbox: gtk::Box,
    scale: gtk::Scale,
}

impl Widgets<AppModel, ()> for AppWidgets {
    type Root = gtk::ApplicationWindow;
    fn init_view(
        _model: &AppModel,
        _components: &<AppModel as Model>::Components,
        sender: relm4::Sender<<AppModel as Model>::Msg>,
    ) -> Self {
        let window = gtk::ApplicationWindow::builder()
            .title("Brightness Controller")
            .default_width(300)
            .build();

        let vbox = gtk::Box::builder()
            .orientation(gtk::Orientation::Vertical)
            .spacing(10)
            .build();

        vbox.set_margin_all(10);

        let scale = gtk::Scale::with_range(gtk::Orientation::Horizontal, 0.0, 100.0, 1.0);
        let value = BrightnessChange::get_value().unwrap() as f64;
        println!("{value}");
        scale.set_value(value);

        scale.connect_change_value(move |_scale, _, value| {
            send!(sender.clone(), AppMsg::Value(value as u32));
            gtk::Inhibit::default()
        });

        window.set_child(Some(&vbox));
        vbox.append(&scale);
        let event = EventControllerKey::builder()
            .build();
        event.connect_key_pressed(|keyval, keycode, _, )| {
            match keyval {
               
            }
        });

        Self {
            window,
            vbox,
            scale,
        }
    }
    fn view(&mut self, _model: &AppModel, _sender: relm4::Sender<<AppModel as relm4::Model>::Msg>) {}
    fn root_widget(&self) -> Self::Root {
        self.window.clone()
    }
}

struct AppModel;

enum AppMsg {
    Value(u32),
}

impl Model for AppModel {
    type Msg = AppMsg;
    type Widgets = AppWidgets;
    type Components = ();
}

impl AppUpdate for AppModel {
    fn update(
        &mut self,
        msg: Self::Msg,
        _components: &Self::Components,
        _sender: relm4::Sender<Self::Msg>,
    ) -> bool {
        match msg {
            AppMsg::Value(value) => {
                BrightnessChange::with_value(value).unwrap();
            }
        }
        true
    }
}

fn main() {
    let model = AppModel;
    let app = RelmApp::new(model);
    app.run();
}
