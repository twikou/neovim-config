import sys
from bs4 import BeautifulSoup
from bs4.formatter import HTMLFormatter

html = sys.stdin.read()
formatter = HTMLFormatter(indent=3)
soup = BeautifulSoup(html, "lxml")
print(soup.prettify(formatter=formatter))
