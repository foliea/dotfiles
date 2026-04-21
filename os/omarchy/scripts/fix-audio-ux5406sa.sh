#!/bin/sh
set -e

# Audio Fix for Zenbook S 14 UX5406SA (Lunar Lake + ALC285)

PRODUCT=$(cat /sys/class/dmi/id/product_name 2>/dev/null || echo "")
if ! echo "$PRODUCT" | grep -qi "UX5406SA"; then
    echo "Skipping UX5406SA audio fix (detected: ${PRODUCT:-unknown})."
    exit 0
fi

echo "Applying UX5406SA audio fix..."

sudo pacman -S --noconfirm \
  sof-firmware \
  alsa-ucm-conf \
  alsa-utils \
  pipewire-alsa \
  pipewire-pulse \
  wireplumber

echo "options snd-intel-dspcfg dsp_driver=3" | sudo tee /etc/modprobe.d/sof.conf
echo "options snd-hda-intel model=alc285-zenbook" | sudo tee /etc/modprobe.d/alsa-base.conf

mkdir -p $HOME/.config/pipewire/pipewire.conf.d/
cat <<EOF > $HOME/.config/pipewire/pipewire.conf.d/zenbook-hifi.conf
stream.properties = {
    channelmix.upmix = true
    channelmix.upmix-method = psd
    channelmix.lfe-cutoff = 150
}
EOF

rm -rf $HOME/.config/pulse $HOME/.local/state/wireplumber $HOME/.config/chromium/Default/AudioState 2>/dev/null

echo "Done. Reboot required."