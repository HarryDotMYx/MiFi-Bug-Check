#!/system/bin/sh
if ! applypatch -c MTD:recovery:10913792:01d1cc69625ed7b44e7a3867930307331c6fa27a; then
  applypatch  MTD:boot:10913792:01d1cc69625ed7b44e7a3867930307331c6fa27a MTD:recovery 01d1cc69625ed7b44e7a3867930307331c6fa27a 10913792 01d1cc69625ed7b44e7a3867930307331c6fa27a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
