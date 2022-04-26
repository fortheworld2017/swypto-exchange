#!/bin/bash
while ! nodejs db.js
do
  sleep 1
  echo "Restarting program..."
done
