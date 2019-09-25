.PHONY: build

items=$$(jq -c -s -R 'split("\n")|.[1:-1]|map(split(","))|map({"imagefile":.[0],"title":.[1],"arg":.[2],"subtitle": .[3]})'<items.csv | sed 's/\//\\\//g' | jq -R)

build:
	@/usr/libexec/PlistBuddy -c "Set :objects:1:config:items ${items}" info.plist
