# SVG support

## Enable

The required version to make it work is 14.2.

1. Close Photoshop CC
2. Create an empty text file and name it "generator.json"
3. Copy and paste inside this line of code:
    ```json
      {
        "generator-assets":  {
        "svg-enabled": true
        }
      }
    ```
4. Save this file generator.json in your user home folder.
5. Open Photoshop CC and a PSD file.
6. Activate Generator (File > Generate > Image assets).
7. Rename your vector layers adding a .svg extension. Photoshop will generate SVG files in the assets folder.

Adobe Generator is an open-source technology available on GitHub. You’ll find more information about the Configuration Options here: https://github.com/adobe-photoshop/generator-assets/wiki/Configuration-Options.
