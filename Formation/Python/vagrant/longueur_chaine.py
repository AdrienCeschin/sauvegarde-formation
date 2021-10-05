string1 = str(input('Please enter a first string: '))
string2 = str(input('Please enter a second string: '))

#First case, the first string is longer.
if len(string1) > len(string2):
    print('The first string, {0}, is the longest of the two'.format(string1))
#Second case, the second string is longer.
elif len(string2) > len(string1):
    print('The second string, {0}, is the longest of the two'.format(string2))
#Third and last case, the first string is as long as the second one.
else:
    print('The two string are of the same size, first string being {0}, and second string being {1}'.format(string1, string2))