#!/usr/bin/env python3

from flask import Flask, jsonify
from flask_restful import Api, Resource
from datetime import datetime
import json

app = Flask(__name__)
api = Api(app)

class Time(Resource):
    def get( self):
        result = {'version': 'v1'}
        result['time'] = datetime.now().time().__str__()
        return jsonify(result)

api.add_resource(Time, "/time", "/time/")

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
