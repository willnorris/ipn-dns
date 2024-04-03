# ipn-dns

This is the DNS server I use for the `ipn.willnorris.net` zone.
It is a basic [coredns] server with the [coredns-tailscale] plugin,
running in a docker container on Fly.io.
It mirrors the DNS records from my personal tailnet onto a custom domain.

More details at <https://willnorris.com/2023/tailscale-custom-domain/>.

[coredns]: https://coredns.io/
[coredns-tailscale]: https://github.com/damomurf/coredns-tailscale
