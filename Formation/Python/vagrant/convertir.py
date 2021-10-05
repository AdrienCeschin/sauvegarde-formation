currency = str(input('Please enter the currency you want to use: '))
value = float(input('Please enter the value you want to convert: '))
change = 1.1

if currency == 'E':
    print('This amount corresponds to {0}$'.format(value*change))
elif currency == '$':
    print('This amount corresponds to {0}$'.format(value))
else:
    print('Please enter a correct currency, this program recognize only euros (E) and dollars ($)')

