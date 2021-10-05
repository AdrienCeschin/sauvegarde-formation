# Import the Flask module that has been installed.
from flask import Flask, jsonify
# Createing a "games" JSON / dict to emulate data coming from a database.
games = [
  {
    "id": 0,
    "name": "Scrabble",
    "editor": "mattel",
    "year_published": "1978",
    "description": "descp",
    "category": "family",
    "time": "60min",
    "number_player": "2-5"
  },
  {
    "id": 1,
    "name": "Aventuriers du rail",
    "editor": "asmodee",
    "year_published": "2006",
    "description": "descp",
    "category": "family",
    "time": "45min",
    "number_player": "2-5"
  }
]

# Creating a new "app" by using the Flask constructor. Passes __name__ as a parameter.
app = Flask(__name__)

# Annotation that allows the function to be hit at the specific URL.
@app.route("/")
# Generic Python function that returns "Hello world!"
def index():
    return "Hello world!"

# Annotation that allows the function to be hit at the specific URL. Indicates a GET HTTP method.
@app.route("/bordgames/v1.0/games", methods=["GET"])
# Function that will run when the endpoint is hit.
def get_games():
    # Returns a JSON of the games defined above. jsonify is a Flask function that serializes the object for us.
    return jsonify({"games": games})

@app.route("/bordgames/v1.0/games", methods=["POST"])
# Function that will run when the endpoint is hit.
def getpost_games():
    # Returns a JSON of the games defined above. jsonify is a Flask function that serializes the object for us.
    return jsonify({"games": games})


# Annotation that allows the function to be hit at the specific URL with a parameter. Indicates a GET HTTP method.
@app.route("/bordgames/v1.0/games/<int:game_id>", methods=["GET"])
# This function requires a parameter from the URL.
def get_game(game_id):
    # Create an empty dictionary.
    result = {}

    # Loops through all the different games to find the one with the id that was entered.
    for game in games:
        # Checks if the id is the same as the parameter.
        if game["id"] == game_id:
            # Sets the result to the game and makes it a JSON.
            result = jsonify({"game": game})

    # Returns the game in JSON form or an empty dictionary. Should handle the error like 404, but will not cover here.
    return result

# Checks to see if the name of the package is the run as the main package.
if __name__ == "__main__":
    # Runs the Flask application only if the main.py file is being run.
    app.run(host='0.0.0.0')