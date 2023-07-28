from fastapi import FastAPI
import random
import string

app = FastAPI()

@app.get("/")
async def root():
    # Generate a random HTML string
    random_string = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
    html_content = f"<h1>Your Random String: {random_string}</h1>"
    return {"message": "HTML Generated Successfully", "html": html_content}

# To run this application, you would typically use the command `uvicorn main:app --reload`
# from the command line, where "main" is the name of this Python file (main.py) and "app"
# is the name of the FastAPI instance.

# Note: This command cannot be run in this environment as it would start a web server
# that listens for incoming requests, which this environment doesn't support.

# However, you can take this code and run it in your local environment. Once the server is
# running, you can visit `http://localhost:8000` to see the output.
