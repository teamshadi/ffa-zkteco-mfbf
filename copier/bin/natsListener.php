<?php

require_once 'vendor/autoload.php';

// get uri to use
$natsUri = getenv('UPDATER_NATSURI');
if(!$natsUri) {
  throw new \Exception('Please set env var UPDATER_NATSURI');
}

// https://github.com/repejota/phpnats/blob/develop/examples/connect.php
$options = new \Nats\ConnectionOptions();
$options
  ->setHost(parse_url($natsUri, PHP_URL_HOST))
  ->setPort(parse_url($natsUri, PHP_URL_PORT))
;

// https://github.com/repejota/phpnats#basic-usage
$client = new \Nats\Connection($options);
$client->connect();

# Responding to requests
$sid = $client->subscribe("foo", function ($res) {
      echo("Received nats foo".PHP_EOL);
      //$res->reply("Hello, " . $res->getBody() . " !!!");

      // exceptions are just output to screen, without exiting the listener
      try {
        $copier = new \FfaZktecoMfbf\Copier();
        $copier->locks->update();
        $copier->copyLocksToOdbc(true);
        echo("Completed copy".PHP_EOL);
      } catch(\Exception $e) {
        echo($e->getMessage());
      }
});


# Wait indefinitely. Pass 1 to wait for 1 message
$client->wait();
