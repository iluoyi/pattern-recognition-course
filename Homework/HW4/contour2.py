#!/usr/bin/env python

import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

matplotlib.rcParams['xtick.direction'] = 'out'
matplotlib.rcParams['ytick.direction'] = 'out'

delta = 0.025
x = np.arange(-4.0, 4.0, delta)
y = np.arange(-4.0, 4.0, delta)
X, Y = np.meshgrid(x, y)
Z1 = mlab.bivariate_normal(X, Y, 1.0, 1.0, 1.0, 0.0, 0.5)
Z2 = mlab.bivariate_normal(X, Y, 1.0, 1.0, -1.0, 0.0, 0.5)
D1 = Z2 - Z1
D2 = 2 * Z2 - Z1

# Create a simple contour plot with labels using default colors.  The
# inline argument to clabel will control whether the labels are draw
# over the line segments of the contour, removing the lines beneath
# the label
plt.figure()
plt.contour(X, Y, Z1)
plt.contour(X, Y, Z2)

plt.contour(X, Y, D1, 0, colors='r')
plt.contour(X, Y, D2, 0, colors='g')

plt.title('Question 2(b) by Yi Luo')

plt.show()