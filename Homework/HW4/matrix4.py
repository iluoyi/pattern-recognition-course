#!/usr/bin/env python

from __future__ import division
import math
from math import exp, pow, pi
import numpy as np

mu = np.array([1,2,2]).T
sigma = np.array([[1,0,0],[0,5,2],[0,2,5]])

x = np.array([0.5,0,1]).T

p1 = 1/(math.pow(2*math.pi, 3/2 )*math.pow(np.linalg.norm(sigma,ord=None), 1/2))
p2 = math.exp(-1/2*np.dot(np.dot((x-mu).T, np.linalg.inv(sigma)),(x-mu)))

p = p1 * p2

print p