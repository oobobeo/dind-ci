import openai
import os

openai.api_key = os.getenv("OPENAI_API_KEY")

def generate_html(topic, model="gpt-3.5-turbo"):
    prompt = f"sample html page about {topic}. do not include img tags"
    messages = [{"role": "user", "content": prompt}]
    response = openai.ChatCompletion.create(
    model=model,
    messages=messages,
    temperature=0,
    )
    return response.choices[0].message["content"]

# print(generate_html("sample html page about cakes. "))