#!/bin/bash

echo "Installing thsay..."

INSTALL_DIR="$HOME/.myquote"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"

curl -sL https://raw.githubusercontent.com/finefeinlyy/thsay/main/thsay.sh -o "$INSTALL_DIR/thsay.sh"
curl -sL https://raw.githubusercontent.com/finefeinlyy/thsay/main/quotes.txt -o "$INSTALL_DIR/quotes.txt"

chmod +x "$INSTALL_DIR/thsay.sh"

ln -sf "$INSTALL_DIR/thsay.sh" "$BIN_DIR/thsay"

SHELL_RC="$HOME/.zshrc"
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
fi

echo "Installed! Restart terminal or run: source ~/.zshrc"
echo "Then try: thsay"



