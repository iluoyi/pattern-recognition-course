#!/usr/bin/env python

import numpy as np
from scipy.linalg import *
import math
from math import exp, pow, pi

sigma = np.array([[1,0,0],[0,5,2],[0,2,5]])

E = eig(sigma)
Aw = np.dot(E[0], np.linalg.matrix_power(E[1], -0.5))
print Aw