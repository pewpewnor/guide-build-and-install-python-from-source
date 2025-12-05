cd ~/Downloads

python_version="3.14.1"

python_file="Python-$python_version.tar.xz"

wget https://www.python.org/ftp/python/3.14.1/$python_file
tar xf $python_file

sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev liblzma-dev \
  llvm

./configure --enable-optimizations --with-ensurepip=install

make -j $(($(nproc) / 2 + 1))

sudo make altinstall

rm -r ./Python-3.14.1
