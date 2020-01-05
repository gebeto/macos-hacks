# Bear Pro

This is a shared library that spoofs some ObjC method calls to enable Bear Pro subscription for free.

Make sure to disable SIP (`csrutil disable` from Recovery), for more information see below.

## Building
```
git clone https://github.com/gebeto/bear-pro
cd bear-pro
make
```

## Launching Application
You can use `run.sh`, it's a wrapper script that sets necessary environment variables to insert the lib and launches Bear (it assumes that Bear.app installed to /Applications, edit the script if it differs for you).

## Important
This hack doesn't work on systems with SIP (System Integrity Protection) enabled, and it's enabled by default since El Capitan. It can be easily disabled from Recovery Mode but it's another layer of security which is always good to have so disabling it permanently is not the wisest idea. I'll implement some solution to bypass this restriction when I have time.
