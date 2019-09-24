package cmd

import (
	"fmt"
	"os"
	"strings"

	"github.com/spf13/cobra"
	"github.com/steinarvk/linetool/lib/lines"
	"github.com/steinarvk/orc"
)

func init() {
	showUsage := func() {
		fmt.Println(strings.TrimSpace(`
linetool add reads lines from stdin and appends new ones to a file.

Usage: linetool add [writable-list-file]

Example:
	$ echo hello | linetool add /tmp/myfile
	$ echo world | linetool add /tmp/myfile
	$ echo hello | linetool add /tmp/myfile
	$ cat /tmp/myfile
	hello
	world
`))
		fmt.Println()
	}

	_ = orc.Command(Root, orc.Modules(), cobra.Command{
		Use:   "add [writable-list-file]",
		Short: "Read lines from stdin and append new ones to a file",
	}, func(args []string) error {
		if len(args) != 1 {
			showUsage()
			return fmt.Errorf("got %d argument(s), wanted 1", len(args))
		}

		filename := args[0]

		addLines, err := lines.Read(os.Stdin)
		if err != nil {
			return err
		}

		return lines.AddNewToFile(filename, addLines)
	})
}
