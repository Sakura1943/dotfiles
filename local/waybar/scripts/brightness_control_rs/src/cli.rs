use clap::{Args, Command, CommandFactory, Parser, Subcommand};

#[derive(Parser)]
#[command(version, author, about, long_about = None)]
pub struct Cli {
    #[command(subcommand)]
    pub subcommands: SubCommands,
}

#[derive(Subcommand, Clone)]
pub enum SubCommands {
    #[command(about = "Running on Graphical user interface")]
    Gui(Gui),
    #[command(about = "Running on command-line interface")]
    Cmd(Cmd),
}

#[derive(Args, Clone)]
pub struct Gui {
    #[arg(long, default_value_t = 300, help = "Window width")]
    pub width: u32,
    #[arg(long, help = "Window height")]
    pub height: Option<u32>,
}

#[derive(Args, Clone)]
pub struct Cmd {
    #[arg(help = "Brightness value")]
    pub value: u32,
    #[arg(short, long, value_name = "INC_VALUE", help = "Increase brightness")]
    pub inc: bool,
    #[arg(short, long, value_name = "DEC_VALUE", help = "Decrease brightness")]
    pub dec: bool,
}

#[allow(dead_code)]
impl Cli {
    pub fn build() -> Self {
        Self::parse()
    }

    pub fn cmd() -> Command {
        Self::command()
    }
}
