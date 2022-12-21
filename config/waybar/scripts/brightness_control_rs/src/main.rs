use brightness_control::cli::{Cli, SubCommands};
use brightness_control::cmd;
use brightness_control::ui;
use brightness_control::Result;

fn main() -> Result<()> {
    let cli = Cli::build();
    match cli.subcommands {
        SubCommands::Gui(gui) => {
            ui::run(gui.width, gui.height);
        }
        SubCommands::Cmd(cmd) => {
            cmd::run(cmd)?;
        }
    }
    Ok(())
}
