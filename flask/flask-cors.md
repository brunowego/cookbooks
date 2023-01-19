# Flask CORS

## Library

### Dependencies

- [Flask](/flask.md#library)

### Installation

```sh
# As user dependency
pip3 install -U flask-cors

# As project dependency
echo 'Flask-Cors==1.10.3' >> ./requirements.txt
```

### Testing

```sh
#
cat << EOF > ./app.py
from flask import Flask, jsonify


app = Flask(__name__)


@app.route('/', methods=['GET'])
def helloWorld():
  return jsonify(message='Hello, world!')


if __name__ == '__main__':
  app.run(host='0.0.0.0', port='8080', debug=True)
EOF

#
FLASK_ENV=development flask run

#
sudo hostess add app.domain.tld 127.0.0.1
```

```sh
#
npm install axios

#
cat << EOF > ./app.js
const axios = require('axios');

axios.get('http://app.domain.tld:5000')
  .then(response => console.log(response))
  .catch(error => console.log(error));
EOF

#
node ./app.js
```

```sh
#
cat << EOF > ./app.py
from flask import Flask, jsonify
from flask_cors import cross_origin


app = Flask(__name__)


@app.route('/')
@cross_origin()
def helloWorld():
  return jsonify(message='Hello, cross-origin-world!')


if __name__ == '__main__':
  app.run(host='0.0.0.0', port='8080', debug=True)
EOF
```

```sh
#
cat << EOF > ./app.py
from flask import Flask, jsonify
from flask_cors import CORS


app = Flask(__name__)
CORS(app)


@app.route('/')
def helloWorld():
  return jsonify(message='Hello, cross-origin-world!')


if __name__ == '__main__':
  app.run(host='0.0.0.0', port='8080', debug=True)
EOF
```
