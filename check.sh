#!/bin/sh

ansible-playbook -i ansible/hosts -K -D -C ansible/deploy.yaml "$@"
