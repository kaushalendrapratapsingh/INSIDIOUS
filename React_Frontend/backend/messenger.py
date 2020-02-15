from flask import Flask, request, jsonify
import anvil.server

anvil.server.connect("X57VP5BSBEGW6UTK7BQQUIFO-AAYJXYXOPDKWSY53-CLIENT")

# Initialize the Flask application
app = Flask(__name__)

# route http posts to this method
@app.route('/dev', methods=['POST'])
def server_comm():

    if request.method == 'POST':
        url = request.get_json()['body']

        anvil_rsp = anvil.server.call('recurl', url)

        return anvil_rsp, 200

# start flask app
app.run(port=5000)
