#!/bin/bash
## usage sh sign.sh "./ezssh/ezssh/ezssh" "./ezssh/ezssh/*" "Developer ID Application: Keytos LLC (HVPRU6Y9WE)" "./entitlements.plist"
## RunFile $1 "./ezssh/ezssh/ezssh"
## Directory $2 ./ezssh/ezssh/*
## CertName $3 "Developer ID Application: Keytos LLC (HVPRU6Y9WE)" 
## Entitlements $4 ./entitlements.plist 

echo "======== INPUTS ========"
echo "RunFile: $1"
echo "Directory: $2"
echo "CertName: $3"
echo "Entitlements: $4"
echo "======== END INPUTS ========"

for f in $2
do 
    if [ "$f" = "$1" ]; 
    then 
        echo "Runtime Signing $f" 
        codesign --timestamp --sign "$3" $f --options=runtime --no-strict --entitlements $4
    else 
        echo "Signing $f" 
        codesign --timestamp --sign "$3" $f --no-strict 
    fi
done

# xcrun altool --notarize-app --primary-bundle-id "group.io.keytos.ezssh" --username "igalfsg@gmail.com" --password "@keychain:AC_PASSWORD" --asc-provider "HVPRU6Y9WE" --file "./ezssh/ezssh.zip"
# xcrun altool --notarization-info 28d268b2-d8bc-4ace-9d25-4310bacfdfde -u "igalfsg@gmail.com" --password "@keychain:AC_PASSWORD"
