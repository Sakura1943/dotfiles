module completions {

  # Brightness controller
  export extern brightness_control [
    --help(-h)                # Print help
    --version(-V)             # Print version
  ]

  # Running on Graphical user interface
  export extern "brightness_control gui" [
    --width: string           # Window width
    --height: string          # Window height
    --help(-h)                # Print help
  ]

  # Running on command-line interface
  export extern "brightness_control cmd" [
    value: string             # Brightness value
    --inc(-i)                 # Increase brightness
    --dec(-d)                 # Decrease brightness
    --help(-h)                # Print help
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
