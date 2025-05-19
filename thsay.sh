#!/bin/bash

VERSION="1.0.0"

case "$1" in
  -h|--help)
    echo "thsay v$VERSION — Random Thai quotes for macOS"
    echo ""
    echo "Usage:"
    echo "  thsay             Display and speak a random Thai quote"
    echo "  thsay --help      Show this help message"
    echo "  thsay --version   Show version"
    exit 0
    ;;
  -v|--version)
    echo "thsay version $VERSION"
    exit 0
    ;;
esac

QUOTE_FILE="${THSAY_QUOTES:-"$(brew --prefix)/share/thsay/quotes.txt"}"

if [ ! -f "$QUOTE_FILE" ]; then
  echo "quotes.txt not found at $QUOTE_FILE"
  exit 1
fi

QUOTE=$(shuf -n 1 "$QUOTE_FILE")

echo "$QUOTE"

if command -v say &> /dev/null; then
  say -v Kanya "$QUOTE"
fi
