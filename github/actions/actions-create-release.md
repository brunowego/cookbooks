# Actions Create Release

<!--
# Java
https://github.com/Bonitasoft-Community/getting-started-tutorial/blob/6c2a0b10c9974684b4badf0f265ffd046350b7f6/.github/workflows/release.yml
https://github.com/ELDEpendenci/ELDependenci-MVC/blob/7b06183dd378684a5b7726a66ea38003627573cf/.github/workflows/publish.yml

#
https://github.com/Alexal3/bolt-meter-bot
-->

TODO

<!--
    - name: Create Release
      # id: create_release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ steps.sha.outputs.sha8 }}
        release_name: Release${{ steps.sha.outputs.sha8 }}
        body: |
          Release ${{ steps.sha.outputs.sha8 }}
        draft: false
        prerelease: false
-->
