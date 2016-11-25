package main

import (
    "github.com/nats-io/go-nats"
"time"
)

func main() {
  // url := nats.DefaultURL
  // url := "nats://nats-main:4222"
  url := os.Getenv("NATS_URI")
  nc, _ := nats.Connect(url)

  // Make a request
  nc.Request("foo", []byte("help me"), 10*time.Millisecond)
}
