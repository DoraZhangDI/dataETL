yum install vim gcc make wget -y
yum install openssl-devel zlib-devel readline-devel sqlite-devel -y
wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar -zxvf Python-2.7.10.tgz
cd Python-2.7.10
./configure --enable-shared --enable-loadable-sqlite-extensions     --prefix=/usr/lib/python2.7 --with-zlib --with-ssl
make && make install
mv /usr/bin/python /usr/bin/python2.6.6
ln -s /usr/lib/python2.7/bin/python2.7 /usr/bin/python
cd /etc/ld.so.conf.d/
touch python2.7.conf
echo '/usr/lib/python2.7/lib' > python2.7.conf
/sbin/ldconfig -v
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
ln -s /usr/lib/python2.7/bin/pip /usr/bin/pip
pip install numpy
