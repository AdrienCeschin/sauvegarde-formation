class Jeu:

    name = ''
    editor = ''
    release_year = ''
    description = ''
    category = ''
    duration = ''
    number_players = ''

    def listeJeux(self) :
        file_games = open('./vagrant/jeu/jeu.txt','r')
        jeux = file_games.readlines()
        for jeu in jeux :
            gameName = jeu.split(',')[0]
            print(gameName)
        file_games.close()
    
    def ajoutJeu(self) :
        newGame = '\n'
        newGame = newGame + str(input('What is the name of the game ? '))
        newGame = newGame + ', ' + str(input('What is the editor of the game ? '))
        newGame = newGame + ', ' + str(input('In which year was the game released ? '))
        newGame = newGame + ', ' + str(input('Please fill in a short description of this game. '))
        newGame = newGame + ', ' + str(input('What is the category of the game ? '))
        newGame = newGame + ', ' + str(input('How long would it take to end the game, in average ? '))
        newGame = newGame +', ' + str(input('How many players can try this game simultaneously ? '))
        file_games = open('./vagrant/jeu/jeu.txt','r+')
        file_games.read()
        file_games.write(newGame)
        file_games.close()

    def voirJeu(self,id) :
        file_games = open('./vagrant/jeu/jeu.txt','r')
        jeux = file_games.readlines()
        for jeu in jeux :
            gameName = str(jeu).split(',')[0]
            if gameName == id :
                return str(jeu)
        file_games.close()
        return 'Game not found, please try a valid id'

    def supprimeJeu(self,id):
        file_games = open('./vagrant/jeu/jeu.txt','r')
        jeux = file_games.readlines()
        file_games.close()
        file_games = open('./vagrant/jeu/jeu.txt','w')
        for jeu in jeux :
            gameName = str(jeu).split(',')[0]
            if gameName != id :
                file_games.writelines(jeu)
        file_games.close()

    
    
