use brightness_change::BrightnessChange;
use gtk::traits::{BoxExt, GtkWindowExt, RangeExt, WidgetExt};
use gtk::{Inhibit, Align};
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
        model: &AppModel,
        _components: &<AppModel as Model>::Components,
        sender: relm4::Sender<<AppModel as Model>::Msg>,
    ) -> Self {
        let window = gtk::ApplicationWindow::builder()
            .title("Brightness Controller")
            .build();

        if let Some(height) = model.height {
            window.set_default_height(height as i32);
        }
        window.set_default_width(model.width as i32);

        let vbox = gtk::Box::builder()
            .orientation(gtk::Orientation::Vertical)
            .spacing(10)
            .build();

        vbox.set_margin_all(10);
        vbox.set_valign(Align::Center);

        let scale = gtk::Scale::with_range(gtk::Orientation::Horizontal, 0.0, 100.0, 1.0);
        let value = BrightnessChange::get_value().unwrap() as f64;
        scale.set_value(value);
        scale.connect_change_value(move |_scale, _, value| {
            send!(sender, AppMsg::Value(value as u32));
            Inhibit(false)
        });

        window.set_child(Some(&vbox));
        vbox.append(&scale);
        Self {
            window,
            vbox,
            scale,
        }
    }
    fn root_widget(&self) -> Self::Root {
        self.window.clone()
    }
    fn view(&mut self, _model: &AppModel, _sender: relm4::Sender<<AppModel as Model>::Msg>) {}
}

struct AppModel {
    height: Option<u32>,
    width: u32,
}

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

pub fn run(width: u32, height: Option<u32>) {
    let model = AppModel { width, height };
    let app = RelmApp::new(model);
    app.run();
}
