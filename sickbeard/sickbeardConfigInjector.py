import re
import sys

if len(sys.argv) < 4:
	raise ValueError("Invalid arguments. Expecting " + sys.argv[0] + " pathToConfFile someKey someValue")

pathToConfFile = sys.argv[1]
key = sys.argv[2]
value = sys.argv[3]

replacementRegex = key + "\s?=\s?.*"
replacementText = key + " = " + value

with open(pathToConfFile, "rt") as fin:
	for line in fin:
		print re.sub(replacementRegex,replacementText, line.rstrip())