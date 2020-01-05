# MacOS Apps Hacks

This is a shared libraries that spoofs some ObjC method calls.

Make sure to disable SIP (`csrutil disable` from Recovery), for more information see below.

## Hacks

| Application    | Link                               |
|----------------|------------------------------------|
| Things 3 Trial | [things-trial](hacks/things-trial) |
| Bear           | [bear-pro](hacks/bear-pro)         |

## Important
This hack doesn't work on systems with SIP (System Integrity Protection) enabled, and it's enabled by default since El Capitan. It can be easily disabled from Recovery Mode but it's another layer of security which is always good to have so disabling it permanently is not the wisest idea. I'll implement some solution to bypass this restriction when I have time.

## Building
```
git clone https://github.com/gebeto/macos-hacks
cd macos-hacks
cd <APPLICATION>
make
```

## Launching Applications
You can use `run.sh`, it's a wrapper script that sets necessary environment variables to insert the lib and launches Applications (it assumes that <APPLICAITON> installed to /Applications, edit the script if it differs for you).
