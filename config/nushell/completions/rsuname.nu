module completions {

  # Uname rewrite with rust program language
  export extern rsuname [
    --all(-a)                 # print all information, in the following order, except omit -p and -i if unknown:
    --kernel-name(-s)         # print the kernel name
    --nodename(-n)            # print the network node hostname
    --kernel-release(-r)      # print the kernel release
    --kernel-version(-v)      # print the kernel version
    --machine(-m)             # print the machine hardware name
    --processor(-p)           # print the processor type (non-portable)
    --hardware-platform(-i)   # print the hardware platform (non-portable)
    --operating-system(-o)    # print the operating system
    --help(-h)                # Print help information (use `--help` for more detail)
    --version(-V)             # Print version information
  ]

}

use completions *
