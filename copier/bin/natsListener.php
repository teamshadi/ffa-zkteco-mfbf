<?php

require_once 'vendor/autoload.php';

// https://github.com/repejota/phpnats#basic-usage
$client = new \Nats\Connection();
$client->connect();

# Responding to requests
$sid = $client->subscribe("foo", function ($res) {
      $res->reply("Hello, " . $res->getBody() . " !!!");
      $copier = new \FfaZktecoMfbf\Copier();
      $copier->copyLocksToOdbc();
});


# Wait indefinitely. Pass 1 to wait for 1 message
$client->wait();
