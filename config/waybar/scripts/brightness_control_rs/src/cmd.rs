use crate::{cli::Cmd, Result};
use anyhow::anyhow;
use brightness_change::BrightnessChange;

pub fn run(cmd: Cmd) -> Result<()> {
    let value = cmd.value;
    match (cmd.inc, cmd.dec) {
        (true, false) => {
            BrightnessChange::up_with_value(value)?;
        }
        (false, true) => {
            BrightnessChange::down_with_value(value)?;
        }
        (false, false) => {
            BrightnessChange::with_value(value)?;
        }
        _ => {
            return Err(anyhow!(
                "Only brightness increase or decrease is allowed, or change brightness with value"
            ));
        }
    }
    Ok(())
}
