# DNS Management Script for Linux and macOS

## Table of Contents

1. [Introduction](#introduction)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Custom DNS](#custom-dns)
5. [Usage](#usage)
6. [Contributing](#contributing)

## Introduction

This Bash script allows you to easily manage DNS settings on both Linux and macOS systems. It provides an easy-to-use menu that enables you to set your DNS to custom addresses, Google DNS, Cloudflare DNS, or remove any custom DNS settings entirely.

## Requirements

- Linux with `systemd-resolved` or macOS
- Superuser access for modifying DNS settings
- Bash shell for running the script

## Installation

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your-username/your-repository-name.git
    ```

2. **Navigate to the Script Directory**

    ```bash
    cd your-repository-name
    ```

3. **Make the Script Executable**

    ```bash
    chmod +x set_dns.sh
    ```
## Custom DNS

The script comes pre-configured with default DNS addresses. If you wish to use your own custom DNS addresses, follow these steps:

1. Open set_dns.sh in a text editor of your choice.
  
2. Locate the following lines:

    ```bash
    # Custom DNS servers
    DNS1="185.51.200.2"
    DNS2="178.22.122.100"
    ```
3. Replace 185.51.200.2 and 178.22.122.100 with your custom DNS server addresses.
 
4. Save the file and then run the script.

## Usage

To run the script, simply execute the following command:

```bash
./set_dns.sh
```

## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests. For major changes or features, please open an issue for discussion before making a pull request.
