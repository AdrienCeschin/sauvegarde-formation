from user import user
class membre(user):

    def update(self, dico):
        if self.connecte == True :
            self.id = dico['id']
            self.prenom = dico['prenom']
            self.nom= dico['nom']
            self.role = dico['role']
            self.presentation = dico['pres']
            self.email = dico['mail']
            self.mdp = dico['mdp']
            monFichier = open("user.txt", "r")
            maLine=monFichier.readline()
            newfile = ""
            while maLine :
                if maLine.split(",")[0] != self.id:
                    newfile += maLine 
                else: 
                    newfile += "{},{},{},{},{},{},{}".format(self.id,self.prenom,self.nom,self.role,self.presentation,self.email,self._user__m)
                maLine=monFichier.readline()
            monFichier.close()
            monFichier = open("user.txt", "w")
            monFichier.write(newfile)
    
    def menu(self):
        print("Bienvenu membre " + self.nom +" : ")
        return input('Modifier Profil (y/n)')