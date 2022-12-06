from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(hots='redis', port=6379)
@app.rout('/')

def hello():
    redis.incr('hits')
    counter = str(refis.get('hits'), 'utf-8')
    return counter

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)