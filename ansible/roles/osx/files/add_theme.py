#!/usr/bin/env python2

from __future__ import print_function
import plistlib
import sys
from xml.parsers.expat import error

 
def load_plist(path):
    try:
       plist = plistlib.readPlist(path)
    except error as e:
       raise RuntimeError("Unable to parse file, is it an XML file?")
    return plist


def save_plist(path, content):
    try:
       plist = plistlib.writePlist(content, path)
    except Exception as e:
       # TODO(sheeprine): Have better error handling
       print(e)


def add_theme(preference_path, theme_path):
    pref = load_plist(preference_path)
    theme = load_plist(theme_path)
    name = theme['name']
    pref['Window Settings'][name] = theme
    save_plist(preference_path, pref)


def main():
    add_theme(sys.argv[1], sys.argv[2])


if __name__ == '__main__':
    main()
