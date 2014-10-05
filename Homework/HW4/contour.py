#!/usr/bin/env python

import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

matplotlib.rcParams['xtick.direction'] = 'out'
matplotlib.rcParams['ytick.direction'] = 'out'

delta = 0.025
x = np.arange(-3.0, 3.0, delta)
y = np.arange(-2.0, 2.0, delta)
X, Y = np.meshgrid(x, y)
Z1 = mlab.bivariate_normal(X, Y, 1.0, 1.0, 1.0, 0.0, 0.5)
Z2 = mlab.bivariate_normal(X, Y, 1.0, 1.0, -1.0, 0.0, 0.5)
Z = Z2 - Z1

# Create a simple contour plot with labels using default colors.  The
# inline argument to clabel will control whether the labels are draw
# over the line segments of the contour, removing the lines beneath
# the label
plt.figure()
CS = plt.contour(X, Y, Z)
#plt.clabel(CS, inline=1, fontsize=10)
plt.title('Question 2(a) by Yi Luo')

plt.show()