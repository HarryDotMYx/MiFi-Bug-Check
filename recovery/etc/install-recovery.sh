#!/system/bin/sh
if ! applypatch -c MTD:recovery:10827776:a9bb74703e92b5fa76a4a0b20918306e38933a92; then
  applypatch  MTD:boot:10827776:a9bb74703e92b5fa76a4a0b20918306e38933a92 MTD:recovery a9bb74703e92b5fa76a4a0b20918306e38933a92 10827776 a9bb74703e92b5fa76a4a0b20918306e38933a92:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
