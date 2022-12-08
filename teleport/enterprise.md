# Teleport Enterprise

TODO

<!-- ```sh
#
cat << EOF | tctl create -f
---
kind: role
version: v5
metadata:
  name: requester
spec:
  allow:
    request:
      search_as_roles:
        - access
EOF

#
cat << EOF | tctl create -f
---
kind: role
version: v5
metadata:
  name: reviewer
spec:
  allow:
    review_requests:
      roles:
        - access
      preview_as_roles:
        - access
EOF
``` -->
