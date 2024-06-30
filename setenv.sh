#!/bin/bash

source .env

sed -i "s/<SECRETMESSAGE>/$SECRETMESSAGE/g" frontend/submit/result.php
sed -i "s/<SECRETKEY>/$SECRETKEY/g" frontend/submit/result.php
sed -i "s/<ANSWERS>/$ANSWERS/g" frontend/submit/result.php
sed -i "s/<SUPERSECRET>/$SUPERSECRET/g" frontend/submit/result.php
