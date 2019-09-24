package cmd

import (
	"github.com/sirupsen/logrus"
	"github.com/spf13/cobra"
)

var Root = &cobra.Command{
	Use:   "linetool",
	Short: "A CLI tool to work with line-oriented text files",
}

func init() {
	logrus.SetLevel(logrus.ErrorLevel)
}
