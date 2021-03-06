package main

import (
	"os"

	"github.com/sbinet/go-python"
)

func init() {
	err := python.Initialize()
	if err != nil {
		panic(err.Error())
	}
}

func main() {
	rc := python.Py_Main(os.Args)
	os.Exit(rc)
}
