sudo tee /etc/haproxy/haproxy.cfg <<EOF
global
  log /dev/log  local0
  log /dev/log  local1 notice
  chroot /var/lib/haproxy
  stats socket /run/haproxy/admin.sock mode 660 level admin
  stats timeout 30s
  user haproxy
  group haproxy
  daemon

  # Default SSL material locations
  ca-base /etc/ssl/certs
  crt-base /etc/ssl/private

  # See: https://ssl-config.mozilla.org/#server=haproxy&server-version=2.0.3&config=intermediate
  ssl-default-bind-ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
  ssl-default-bind-ciphersuites TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256
  ssl-default-bind-options ssl-min-ver TLSv1.2 no-tls-tickets

defaults
  log  global
  option  dontlognull
  timeout connect 5000
  timeout client  50000
  timeout server  50000
  errorfile 400 /etc/haproxy/errors/400.http
  errorfile 403 /etc/haproxy/errors/403.http
  errorfile 408 /etc/haproxy/errors/408.http
  errorfile 500 /etc/haproxy/errors/500.http
  errorfile 502 /etc/haproxy/errors/502.http
  errorfile 503 /etc/haproxy/errors/503.http
  errorfile 504 /etc/haproxy/errors/504.http

frontend apiserver
    bind *:6443
    mode tcp
    default_backend kubernetes-master-nodes

backend apiserver-backend
    mode tcp
    balance roundrobin
    option tcp-check
    server master1 192.168.56.2:6443 check fall 3 rise 2
    # server master2 192.168.56.3:6443 check fall 3 rise 2

frontend etcd-client
    bind *:2379
    mode tcp
    option tcplog
    default_backend etcd-client-backend

backend etcd-client-backend
    mode tcp
    option tcp-check
    balance roundrobin
    server master1 192.168.56.2:2379 check fall 3 rise 2
    #server master2 192.168.56.3:2379 check fall 3 rise 2

frontend etcd-peer
    bind *:2380
    mode tcp
    option tcplog
    default_backend etcd-peer-backend

backend etcd-peer-backend
    mode tcp
    option tcp-check
    balance roundrobin
    server master1 192.168.56.2:2380 check fall 3 rise 2
    #server master2 192.168.56.3:2380 check fall 3 rise 2
EOF

haproxy -c -f /etc/haproxy/haproxy.cfg
