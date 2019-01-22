#!/bin/sh

ansible-playbook -i ansible/hosts -K -D ansible/deploy.yaml
