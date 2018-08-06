import numpy
from matplotlib import pyplot
from pandas import read_csv
from pandas import set_option
import statsmodels.tsa.stattools as ts

def zscore(series):
    return (series - series.mean()) / numpy.std(series)


url = 'allpairoutput.txt'
dataset = read_csv(url, header=None)
names = ['AUDCAD', 'AUDCHF', 'AUDJPY', 'AUDNZD', 'AUDUSD', 'CADCHF', 'CADJPY', 'CHFJPY', 'EURAUD',
        'EURCAD', 'EURCHF', 'EURGBP', 'EURJPY', 'EURNZD', 'EURUSD', 'GBPAUD', 'GBPCAD',
        'GBPCHF', 'GBPJPY', 'GBPNZD', 'GBPUSD', 'NZDCAD', 'NZDCHF', 'NZDJPY', 'NZDUSD',
        'USDCAD', 'USDCHF', 'USDJPY']

# Find cointegrations & print to console
print("STARTING ANALYSIS...")
i = len(names)-1
while i>0:
    x = len(names)-1
    while x>0:
        if names[i] != names[x]:
            p = ts.coint(dataset[i],dataset[x])
            if p[1] < 0.05: # coint found
                correlation = dataset[i].corr(dataset[x]) # get correlation
                if correlation >= 0.3 or correlation <= -0.3:
                    z = zscore(dataset[i]/dataset[x]) # get z
                    zlen = len(z)-1
                    print(names[i],names[x],p[1],correlation,z[zlen]) # Print Data
        x-=1
    i-=1
print("__ANALYSIS COMPLETE__")
