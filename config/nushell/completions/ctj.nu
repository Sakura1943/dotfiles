module completions {

  # Convert CSV data to JSON data
  export extern ctj [
    source: string            # Source File path
    --destination(-d): string # Destination File path
    --verbose(-v)             # Print the processed JSON data
    --help(-h)                # Print help information
    --version(-V)             # Print version information
  ]

}

use completions *
