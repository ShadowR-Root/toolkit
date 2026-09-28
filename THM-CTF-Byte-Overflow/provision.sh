#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y gcc gcc-multilib libc6-dev-i386 gdb python3 python3-pip

mkdir -p /opt/byte-overflow

cp /vagrant/challenge.c /opt/byte-overflow/challenge.c
chown root:root /opt/byte-overflow/challenge.c
chmod 644 /opt/byte-overflow/challenge.c

cat > /opt/byte-overflow/flag.txt <<'EOF'
THM{byte_overflow_beginner_pwn}
EOF

chown root:root /opt/byte-overflow/flag.txt
chmod 600 /opt/byte-overflow/flag.txt

cat > /tmp/build_byte_overflow.sh <<'EOF'
#!/usr/bin/env bash
set -e
cd /opt/byte-overflow
gcc -m32 -O0 -fno-stack-protector -no-pie challenge.c -o byteoverflow
chown root:root byteoverflow
chmod 4755 byteoverflow
EOF

bash /tmp/build_byte_overflow.sh

echo
echo "========================================"
echo " Byte Overflow CTF VM is ready!"
echo "========================================"
echo
echo "Challenge directory: /opt/byte-overflow"
echo "Binary:              /opt/byte-overflow/byteoverflow"
echo
echo "The intended learning path is:"
echo "buffer overflow -> EIP control -> ret2win"
echo
