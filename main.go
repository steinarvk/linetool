package main

import (
  "github.com/steinarvk/orclib/lib/orcmain"

  "github.com/steinarvk/linetool/cmd"
)

func init() {
	orcmain.Init("linetool", cmd.Root)
}

func main() {
	orcmain.Main(cmd.Root)
}
