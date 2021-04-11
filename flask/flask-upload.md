# Flask Upload

<!--
https://pythonbasics.org/flask-upload-file/
https://blog.miguelgrinberg.com/post/handling-file-uploads-with-flask
https://flask.palletsprojects.com/en/1.1.x/patterns/fileuploads/
-->

TODO

```sh
export API_URL=http://127.0.0.1:5000

curl -X POST \
  -m 300 \
  -H 'Content-Type: multipart/form-data' \
  -F "file=@$PWD/test.txt" \
  "http://${API_URL}/upload"
```
