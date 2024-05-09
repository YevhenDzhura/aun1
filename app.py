from flask import Flask, jsonify, render_template, request

app = Flask(__name__)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/multiply', methods=['POST'])
def multiply():
    data = request.get_json()
    num1 = int(data['num1'])
    num2 = int(data['num2'])
    result = num1 * num2
    return jsonify({'result': result})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
