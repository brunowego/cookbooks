# GitHub Cache

TODO

<!--
export GH_REPO='owner/repo'

gh api --paginate -H 'Accept: application/vnd.github+json' /repos/${GH_REPO}/actions/caches | \
  for ID in `jq '.actions_caches[].id'`; \
      do echo "Deleting $$ID"; \
        gh api --method DELETE /repos/${GH_REPO}/actions/caches/$$ID | echo; done
-->
