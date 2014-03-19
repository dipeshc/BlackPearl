import re
import sys

if len(sys.argv) < 5:
	raise ValueError("Invalid arguments. Expecting " + sys.argv[0] + " pathToConfFile section someKey someValue")

pathToConfFile = sys.argv[1]
section = sys.argv[2]
key = sys.argv[3]
value = sys.argv[4]

sectionHeaderRegex = "\[(\w+)\]"
replacementRegex = key + "\s?=\s?.*"
replacementText = key + " = " + value

sectionLocated = False
configUpdateDone = False

with open(pathToConfFile, "rt") as fin:
	for line in fin:
		match = re.match(sectionHeaderRegex, line)
		if match is not None:
			sectionLocated = match.group(1) == section

		if sectionLocated:
			print re.sub(replacementRegex,replacementText, line.rstrip())
		else:
			print line.rstrip()