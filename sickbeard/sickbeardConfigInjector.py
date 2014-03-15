import os
import re
import sys

if len(sys.argv) < 4:
	raise ValueError("Invalid arguments. Expecting " + sys.argv[0] + " pathToConfFile someKey someValue")

pathToConfFile = sys.argv[1]
pathToConfFileTemp = pathToConfFile + ".tmp"
key = sys.argv[2]
value = sys.argv[3]

replacementRegex = key + "\s?=\s?.*"
replacementText = key + " = " + value


with open(pathToConfFileTemp, "wt") as fout:
	with open(pathToConfFile, "rt") as fin:
		for line in fin:
			newLine = re.sub(replacementRegex,replacementText, line.rstrip()) + os.linesep
			fout.write(newLine)

os.rename(pathToConfFileTemp, pathToConfFile);