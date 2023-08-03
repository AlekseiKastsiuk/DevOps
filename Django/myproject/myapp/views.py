from django.http import HttpResponse

def hello(request):
    response = '''Hello, World! My name is Aliaksei Kastsiuk <br>
                  My LinkedIn: <a href="https://www.linkedin.com/in/aliakseikastsiuk/">https://www.linkedin.com/in/aliakseikastsiuk/</a> <br>
                  My Telegram: <a href="https://t.me/mraleksel">https://t.me/mraleksel</a>'''
    return HttpResponse(response)
