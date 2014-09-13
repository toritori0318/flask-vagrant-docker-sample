from flask import Flask
app = Flask(__name__)
app.debug = True

import os
import redis

redis_6379_host = os.environ.get('REDIS_PORT_6379_TCP_ADDR') or 'localhost'
r = redis.StrictRedis(host=redis_6379_host, port=6379)

@app.route('/')
def hello_world():
    r.incr('count')
    return "Hello Vagrant Docker! [%s]" % r.get('count')

if __name__ == '__main__':
    app.run(host='0.0.0.0')
