package main

import (
    "github.com/nats-io/go-nats"
    "time"
    "os"
    "fmt"
)

func main() {
  // url := nats.DefaultURL
  // url := "nats://nats-main:4222"
  url := os.Getenv("UPDATER_NATSURI")
  if url=="" {
     fmt.Printf("Define env var UPDATER_NATSURI\n")
     os.Exit(1)
  }
  fmt.Printf("Publishing to: %s\n", url)
  nc, _ := nats.Connect(url)

  // Make a request
  nc.Request("foo", []byte("help me"), 10*time.Millisecond)
}
