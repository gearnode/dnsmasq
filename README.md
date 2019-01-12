# dnsmasq docker image

A simple docker receipt to create dnsmasq image by building it
from source.

## Table of Contents

- [Abstract](#abstract)
- [Requirements](#requirements)
- [Usage](#usage)
- [Contributing](#contributing)
- [Maintainers](#maintainers)
- [License](#license)

## Abstract

Other docker image use package manager and it's difficult to use specific version
of dnsmasq. So this repository host all version since v2.0 of dnsmasq. And the
docker image use dnsmasq built from source.

## Requirements

dnsmasq docker requires the following software to run on your machine:

- [Docker](https://www.docker.com/) 18.09+

## Usage

> FYI dnsmasq requires `NET_ADMIN` capabilities to run correctly.

Start dnsmasq with configuration file

```
docker run -p 53:53/tcp \
    -p 53:53/udp \
    --cap-add=NET_ADMIN \
    -v ./dnsmasq.conf:/etc/dnsmasq.conf \
    gearnode/dnsmasq:latest
```

Start dnsmasq without configuration file

```
docker run -p 53:53/tcp \
    -p 53:53/udp \
    --cap-add=NET_ADMIN \
    gearnode/dnsmasq:latest -S /dev/127.0.0.1
```

More information on how use dnsmaqs in the [official documentation](http://www.thekelleys.org.uk/dnsmasq/doc.html)

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

## Maintainers

- [Bryan Frimin](https://github.com/gearnode)

See also the list of [contributors](https://github.com/gearnode/dnsmasq/contributors) who participated in this project.

## License

This project is licensed under the Apache License Version 2.0 - see the [LICENSE](LICENSE) file for details
