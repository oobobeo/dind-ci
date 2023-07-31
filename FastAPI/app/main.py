from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from . import ai
import random
import string

app = FastAPI()

@app.get("/")
async def root():
    # Generate a random HTML string
    random_string = ''.join(random.choices(string.ascii_uppercase + string.digits, k=10))
    html_content = f"<h1>Your Random String: {random_string}</h1>"
    return {"message": "HTML Generated Successfully", "html": html_content}

@app.get("/generate/{topic}")
async def generate_html(topic):
    html_content = ai.generate_html(topic)
    return HTMLResponse(content=html_content, status_code=200)
