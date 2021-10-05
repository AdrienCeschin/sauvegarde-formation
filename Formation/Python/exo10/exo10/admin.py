from user import user
class admin(user):

    def delUser(self):
        _id = input("ID User a supprimer: ")
        monFichier = open("user.txt", "r")
        maLine=monFichier.readline()
        newfile = ""
        while maLine :
            if maLine.split(",")[0] != _id:
                newfile += maLine 
            maLine=monFichier.readline()
        monFichier.close()
        monFichier = open("user.txt", "w")
        monFichier.write(newfile)

    def addUser(self):
        monFichier = open("user.txt", "a")
        _id = int(input("Identifiant: "))
        _prenom = input("Prenom: ")
        _nom = input("Nom: ")
        _role =input("Role: ")
        _presentation =input("Presentation: ")
        _email = input("Mail: ")
        _mdp = input("PSW: ")
        if self.checkMdp(_mdp) == 'ok' :
            newLine = "{},{},{},{},{},{},{}".format(_id,_prenom,_nom,_role,_presentation,_email,_mdp)
            monFichier.write("\n" + newLine)
        else:
            print("mdp invalide")
        monFichier.close()

    def menu(self):
        print("Bienvenu Admin " + self.nom +" : ")
        print('1) Ajouter un membre')
        print('2) Supprimer un membre')
        return input("votre choix ? :")