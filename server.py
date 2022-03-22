from flask import Flask, render_template
app = Flask(__name__)

from flask_socketio import *

socketio = SocketIO(app, cors_allowed_origins="*")


# SocketIO Events
@socketio.on('connect')
def connected():
    print('Connected')

@socketio.on('disconnect')
def disconnected():
    print('Disconnected')

@socketio.on('UserAdded')
def userAdded(message):
    print('User Added')
    emit('userAddedResponse', {'data': message}, broadcast=True)


@app.route('/')
def home():
   return render_template('index.html')


if __name__ == '__main__':
    socketio.run(app, debug=True)
