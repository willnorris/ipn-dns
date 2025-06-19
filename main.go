package main

import (
	"github.com/coredns/coredns/core/dnsserver"
	_ "github.com/coredns/coredns/core/plugin"
	"github.com/coredns/coredns/coremain"
	_ "github.com/damomurf/coredns-tailscale"
	_ "github.com/willnorris/records"
)

func main() {
	dnsserver.Directives = append(dnsserver.Directives, "records", "tailscale")
	coremain.Run()
}
