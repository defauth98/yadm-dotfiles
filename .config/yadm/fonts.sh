# Install jetbrains mono
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
unzip JetBrainsMono-2.001.zip
mv JetBrainsMono-*.ttf ~/.local/share/fonts/
sudo mv JetBrainsMono-*.ttf /usr/share/fonts/

rm -rf ttf web JetBrainsMono-2.001.zip LICENSE
