# THM CTF — Byte Overflow

A beginner-friendly VM-based binary exploitation challenge for the Byte Series.

## What it teaches

- stack-based buffer overflow
- saved return address
- cyclic patterns
- EIP control on 32-bit x86
- redirecting execution to a `win()` function

The challenge intentionally avoids ASLR bypasses, ROP, shellcode, and other advanced techniques.

## VM

This project uses Vagrant + VirtualBox with Ubuntu 22.04.

Start it with:

```bash
vagrant up
vagrant ssh
```

Then go to:

```bash
cd /opt/byte-overflow
```

The challenge binary is:

```bash
./byteoverflow
```

## Intended CTF path

```
buffer overflow
      |
      v
find EIP offset
      |
      v
control EIP
      |
      v
find win()
      |
      v
redirect execution
      |
      v
flag
```

## Notes for the room creator

The VM provisions the vulnerable binary as a root-owned SUID executable and creates the flag with root-only permissions.

The flag is generated during provisioning rather than stored in the repository, so the repository does not directly reveal it.

This is intended for an isolated, authorized CTF/lab environment only.

## Repository layout

```
THM-CTF-Byte-Overflow/
├── Vagrantfile
├── provision.sh
├── challenge.c
└── README.md
```
