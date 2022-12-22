from __init__ import create_app
from flask import Response
app = create_app()

@app.route('/', methods=['GET'])
def root():
    content = open('static/index.html', 'r').read()
    return Response(content, mimetype="text/html")

if __name__ == '__main__':
    app.run(debug=True)
