#!/usr/bin/env bash

ssmconnect() {
  aws ssm start-session --target "${1}"
}