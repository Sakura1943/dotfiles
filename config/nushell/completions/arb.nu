module completions {

  # Arch Linux Repository Building CLI
  export extern arb [
    --config-file(-c): string # Configuration file path
    --show-all(-s)            # Show all packages
    --help(-h)                # Print help information
    --version(-V)             # Print version information
  ]

  # Aur package operations
  export extern "arb aur" [
    ...package_name: string   # Aur package name
    --add(-a)                 # Add aur package to repository
    --remove(-r)              # Remove package from repository
    --help(-h)                # Print help information
  ]

  # Official package operations
  export extern "arb official" [
    ...package_name: string   # Official package name
    --add(-a)                 # Add official package to repository
    --remove(-r)              # Remove package from repository
    --help(-h)                # Print help information
  ]

  # Add custom packages to repository with package paths
  export extern "arb custom-add-with-paths" [
    ...package_paths: string  # Package paths
    --help(-h)                # Print help information
  ]

  # Add custom packages to repository with package urls
  export extern "arb custom-add-with-urls" [
    ...package_urls: string   # Package urls
    --help(-h)                # Print help information
  ]

  # Remove custom packages to repository
  export extern "arb custom-remove" [
    ...package_names: string  # Package names
    --help(-h)                # Print help information
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "arb help" [
  ]

  # Aur package operations
  export extern "arb help aur" [
  ]

  # Official package operations
  export extern "arb help official" [
  ]

  # Add custom packages to repository with package paths
  export extern "arb help custom-add-with-paths" [
  ]

  # Add custom packages to repository with package urls
  export extern "arb help custom-add-with-urls" [
  ]

  # Remove custom packages to repository
  export extern "arb help custom-remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "arb help help" [
  ]

}

use completions *
