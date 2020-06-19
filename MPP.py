# -*- coding: utf-8 -*-
"""
Created on Thu Jun 18 20:07:13 2020

@author: Hernandez Silverio jenifer
         Mauricio Trejo Cecilia
"""

"""
# Modus ponendo ponens

"el modo que, al afirmar, afirma"

P → Q. P ∴ Q


Se puede encadenar usando algunas variables

P → Q. 
Q → S. 
S → T. P ∴ T

Ejercicio 
Defina una funcion que resuelva con verdadero o falso segun corresponada

Laura esta en Queretaro
Alena esta en Paris
Claudia esta en San Francisco
Queretaro esta en Mexico
Paris esta en Francia
San Francisco esta en EUA
Mexico esta en America
Francia esta en Europa
EUA esta en America

def esta(E1,E2):
	pass


print(esta("Alena","Europa"))
# true

print(esta("Laura","America"))
# true

print(esta("Laura","Europa"))
# false

Base = [
	["Laura","Queretaro"],
	["EUA","America"]
]

"""
Base = [
	["Laura","Queretaro"],
    ["Alena","Paris"],
    ["Claudia","San Francisco"],
    ["Queretaro","Mexico"],
    ["Paris","Francia"],
    ["San Francisco","EUA"],
    ["Mexico","America"],
    ["Francia","Europa"],
	["EUA","America"]]

def donde(X,Y):
	if not X:
		return []
	if len(X):
		if Y == X[0][0]:
			return X[0][1]
		else:
			return donde(X[1:],Y)

def esta (E1,E2):
	R = donde(Base,E1)
	L = donde(Base, R)
	if L == E2 or R == E2:
		return True
	S = donde(Base, L)
	if S == E2:
		return True
	else:
		return False
print(esta("Alena","Europa"))

print(esta("Laura","America"))

print(esta("Laura","Europa"))