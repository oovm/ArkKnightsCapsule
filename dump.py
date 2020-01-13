from pickle import load
from numpy import array
from wolframclient.serializers import export

with open('monte_carlo.pkl', 'rb') as f:
    x = {k: array(v) for k, v in load(f).items()}
    export(x, 'monte_carlo.wxf', target_format='wxf')
