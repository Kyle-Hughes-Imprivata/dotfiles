#!/usr/local/env bash
which rustup
if [[ $? != 0 ]]
then
  echo "rust not installed"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "rust already installed"
fi

rustup check
rustup update
