use brightness::blocking::Brightness as _;
use std::sync::Arc;

pub struct BrightnessChange;

impl BrightnessChange {
    pub fn with_value(value: u32) -> Result<(), brightness::Error> {
        brightness::blocking::brightness_devices().try_for_each(move |device| {
            let device = Arc::new(device.unwrap());
            let name = device.device_name()?;
            device.set(value)?;
            println!("Device: {name} is {value}");
            Ok(())
        })
    }
    pub fn up_with_value(value: u32) -> Result<(), brightness::Error> {
        brightness::blocking::brightness_devices().try_for_each(move |device| {
            let device = Arc::new(device.unwrap());
            let name = device.device_name()?;
            let old_value = device.get()?;
            let mut new_value = old_value + value;
            if new_value > 100 {
                new_value = 100
            }
            let value = device.get()?;
            device.set(new_value)?;
            println!("Device: {name} is {value}");
            Ok(())
        })
    }
    pub fn down_with_value(value: u32) -> Result<(), brightness::Error> {
        brightness::blocking::brightness_devices().try_for_each(move |device| {
            let device = Arc::new(device.unwrap());
            let name = device.device_name()?;
            let old_value = device.get()?;
            let mut new_value = old_value - value;
            if new_value > 100 {
                new_value = 0
            }
            let value = device.get()?;
            device.set(new_value)?;
            println!("Device: {name} is {value}");
            Ok(())
        })
    }
    pub fn get_value() -> Result<u32, brightness::Error> {
        let value = brightness::blocking::brightness_devices()
            .next()
            .unwrap()?
            .get()?;
        Ok(value)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::{thread::sleep, time::Duration};

    #[test]
    fn it_works() {
        assert!(BrightnessChange::with_value(50).is_ok());
        sleep(Duration::from_secs(2));
        assert!(BrightnessChange::up_with_value(10).is_ok());
        sleep(Duration::from_secs(2));
        assert!(BrightnessChange::down_with_value(10).is_ok());
    }
}
