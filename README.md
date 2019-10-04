# Ansible role to install Webvirtcloud on debian 10

WebVirtCloud is virtualization web interface for admins and users. https://github.com/retspen/webvirtcloud

## This ansible role does:
* Download (via git) webvirtcloud
* install and configure nginx.
* Optionally create a self signed certificate for httpS

## How to use

It doesn't have to be installed directly on the hypervisor. WebvirtCloud can manage remotes libvirtd (tls or ssh).

change values on defaults/main.yml

* secret:  give a random string
* generate_self_signed_cert: true or false, if false, place manually your own certificate and key on the server
* hostname: Will be used for nginx hostname and certificates CN
* ssl_cert_directory: /etc/nginx/ssl WS (Novnc daemon) needs a certkey file (a concat of the cert and the key), it will be generated on thisdirectory.
* ssl_private_key_path: /etc/nginx/ssl/key.pem
* ssl_cert_path: /etc/nginx/ssl/cert.pem

And play the playbook on a debian 10 clean instance.

## When installed

Connect Defaults credentials are admin admin


Connecting webvirtcloud to the hypervisor via ssh:

    mkdir /var/www/.ssh
    chown -R www-data:www-data /var/www/.ssh
    su www-data -s /bin/bash
    ssh-keygen

And put the content of /var/www/.ssh/id_rsa.pub in the hgypervisor'sauthorized_keys file.

Follow the instructions on the webvirtcloud UI.
