def pair(nb) :
    if nb%2==0:
        return True
    else:
        return False


def impair(nb) :
    res = False
    if nb%2!=0:
        res = True
    return res

def ask_input() :
    return int(input('Please enter an integer to find out if it is even or odd. '))

def give_answer(nombre):
    print('La fonction Pair retourne {0} pour la valeur {1}'.format(pair(nombre),nombre))
    print('La fonction Impair retourne {0} pour la valeur {1}'.format(str(impair(nombre)),nombre))