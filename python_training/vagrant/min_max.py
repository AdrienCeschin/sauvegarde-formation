#First get the two values by asking them to the user and make them float numbers 
# (ensuring minimal degradation of the values entered by the user and that we are working on numerical values).
val1 = float(input('Please enter first value: '))
val2 = float(input('Please enter second value: '))

#First case, the first value is bigger.
if val1 > val2:
    print('The second value, val2 = {0}, is the smallest of the two'.format(val2))
#Second case, the second value is bigger.
elif val2 > val1:
    print('The first value, val1 = {0}, is the smallest of the two'.format(val1))
#Third and last case, the two values are identical.
else:
    print('The two values are the same, val1=val2={0}'.format(val1))

#This code manage any type of numerical values.
    