nb_lines = int(input('Please enter the height of the tree, int and positive values only: '))

distance = ' '
branch = '^'

if nb_lines>0:
    n=0
    while n != nb_lines:
        tmp_line = ''
        tmp_distance = distance*(nb_lines-1-n)
        tmp_branch = branch*(2*n+1)
        tmp_line = tmp_distance + tmp_branch + tmp_distance
        print(tmp_line)
        n=n+1
else:
    print('Please follow the instructions and enter a proper (integer and positive) value next time, else you will not get any tree.')