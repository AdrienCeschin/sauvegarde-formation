def mini(a,b) :
    res = a
    if a>b :
        res = b
    return res

def maxi(a,b) :
    res = a
    if a<b :
        res = b
    return res

def ask_input() :
    val1 = len(str(input('Please enter a first word: ')))
    val2 = len(str(input('Please enter a second word: ')))
    return [val1,val2]

def give_answer(val1,val2) :
    M = maxi(val1,val2)
    m = mini(val1,val2)
    if M == m:
        print('Les deux mots font la même longueur.')
    else :
        print('Le plus grand mot fait {0} lettres et le plus petit mot fait {1} lettres'.format(str(M),str(m)))