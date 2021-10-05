mot = input('Please enter a word to check if it is a palindromic word: ')

#This method makes a list of every caracter in a word, then create a second list being the reverse of the first one.
#Eventually the two lists are compared and a customized text is sent back.
def compare_palindrome(word) :

    #Cut the word in a list of caracters.
    mot_tmp1 = list(word.strip())
    mot_tmp2 = list(word.strip())
    #Reverse one of the two lists.
    mot_tmp1.reverse()

    #Initialize the return value.
    res = 'est'

    #Check if it is a palindromic word or not. If not updates the return value.
    if not mot_tmp1 == mot_tmp2 :
        res = 'n\'est pas'
    
    return res

print('Le mot {0} {1} un palindrome.'.format(mot,compare_palindrome(mot)))
