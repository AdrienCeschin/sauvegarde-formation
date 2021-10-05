value = int(input('Please enter a value to check if it is even, odd but a multiple of three, or none of these assertions: '))

if value%2==0:
    print('Ce nombre est pair.')
else:
    if value%3==0:
        print('Ce nombre est impair mais un multiple de trois.')
    else:
        print('Ce nombre n\'est ni pair ni multiple de trois.')