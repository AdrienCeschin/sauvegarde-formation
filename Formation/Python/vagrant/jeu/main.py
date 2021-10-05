from Jeu import *

jeu = Jeu()

print('Please choose what type of action you want to execute :')
print('For displaying all games please press 1')
print('For adding a game please press 2')
print('For displaying a specific game please press 3')
print('For removing a specific game please press 4')
action = str(input())

if action == '1':
    jeu.listeJeux()
elif action == '2':
    jeu.ajoutJeu()
elif action == '3':
    print(jeu.voirJeu(str(input('Please enter the name of the game you are looking for : '))))
elif action == '4':
    jeu.supprimeJeu(str(input('Please enter the name of the game you want to remove : ')))
else:
    print('Your choice was not valid, please try again.')