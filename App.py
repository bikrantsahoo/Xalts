from flask import Flask, jsonify, request
import subprocess

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health_check():
    response = {'result': 'Healthy', 'error': False}
    return jsonify(response)

@app.route('/who', methods=['GET'])
def who_command():
    try:
        who_output = subprocess.check_output(['who']).decode('utf-8')
        response = {'result': who_output.strip(), 'error': False}
        return jsonify(response)
    except Exception as e:
        response = {'result': str(e), 'error': True}
        return jsonify(response)

@app.route('/create', methods=['POST'])
def create_file():
    try:
        # Run the script to generate test.txt
        subprocess.run(['./generate_numbers.sh'], shell=True)
        response = {'result': 'File created successfully', 'error': False}
        return jsonify(response)
    except Exception as e:
        response = {'result': str(e), 'error': True}
        return jsonify(response)

@app.route('/read', methods=['GET'])
def read_file():
    try:
        with open('test.txt', 'r') as file:
            content = file.read()
        response = {'result': content.strip(), 'error': False}
        return jsonify(response)
    except FileNotFoundError:
        response = {'result': 'File not found', 'error': True}
        return jsonify(response)
    except Exception as e:
        response = {'result': str(e), 'error': True}
        return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)
