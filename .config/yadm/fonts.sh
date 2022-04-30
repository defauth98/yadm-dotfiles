# Install jetbrains mono
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
unzip JetBrainsMono-2.001.zip
cp ./ttf ~/.local/share/fonts/ -r
sudo cp ./ttf /usr/share/fonts/ -r

rm -rf ttf web JetBrainsMono-2.001.zip LICENSE

$HOME/.config/yadm/zsh.sh
