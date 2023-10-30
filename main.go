package main

import (
	"github.com/coredns/coredns/core/dnsserver"
	_ "github.com/coredns/coredns/core/plugin"
	"github.com/coredns/coredns/coremain"
	_ "github.com/damomurf/coredns-tailscale"
)

func main() {
	dnsserver.Directives = append(dnsserver.Directives, "tailscale")
	coremain.Run()
}
