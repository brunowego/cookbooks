# Cgroup Driver

## cgroupfs

```sh
cat << EOF | sudo tee /etc/default/kubelet
KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"
EOF
```

## systemd

Native.
