module completions {

  # Brightness controller
  export extern brightness_control [
    --help(-h)                # Print help information
    --version(-V)             # Print version information
  ]

  # Running on Graphical user interface
  export extern "brightness_control gui" [
    --width: string           # Window width
    --height: string          # Window height
    --help(-h)                # Print help information
  ]

  # Running on command-line interface
  export extern "brightness_control cmd" [
    value: string             # Brightness value
    --inc(-i)                 # Increase brightness
    --dec(-d)                 # Decrease brightness
    --help(-h)                # Print help information
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "brightness_control help" [
  ]

  # Running on Graphical user interface
  export extern "brightness_control help gui" [
  ]

  # Running on command-line interface
  export extern "brightness_control help cmd" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "brightness_control help help" [
  ]

}

use completions *
