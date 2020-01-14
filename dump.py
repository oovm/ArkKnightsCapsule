from pickle import load
from wolframclient.serializers import export

with open('monte_carlo.pkl', 'rb') as f:
    export(load(f), 'monte_carlo.wxf', target_format='wxf')
