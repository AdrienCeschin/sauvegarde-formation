class user:
    id = 0
    prenom = ""
    _nom = ""
    role = ""
    presentation = ""
    email = ""
    __mot_de_passe = "" # private mot_de_passe
    connecte = False

    def __init__(self, dico):
        self.id = dico['id'] 
        self.prenom = dico['prenom']
        self.nom = dico['nom']
        self.role = dico['role']
        self.presentation = dico['pres']
        self.email = dico['mail']
        self.__mot_de_passe = dico['mdp']

    def get_nom(self):
        return self._nom.upper()

    def set_nom(self, valeur):
        self._nom = "ma regle a moi " + valeur

    def get_mot_de_passe(self):
        return "*" * len(self._mdp)

    def set_mot_de_passe(self,valeur):
        _maj,_min,_int = False,False,False
        i=0
        mdp = list(valeur)
        if(len(valeur)>=8 ):
            while (_maj == False and _min == False and _int == False) or i<len(valeur):
                if mdp[i].isupper():
                    _maj=True
                if mdp[i].islower():
                    _min=True
                if mdp[i].isdigit():
                    _int=True
                if _maj == True and _min == True and _int == True:
                    self._mdp = valeur
                i=i+1
            return 'ko'
        else:
            return 'ko'

    def checkMdp(self,valeur):
        _maj,_min,_int = False,False,False
        i=0
        mdp = list(valeur)
        if(len(valeur)>=8 ):
            while (_maj == False and _min == False and _int == False) or i<len(valeur):
                if mdp[i].isupper():
                    _maj=True
                if mdp[i].islower():
                    _min=True
                if mdp[i].isdigit():
                    _int=True
                if _maj == True and _min == True and _int == True:
                    return 'ok'
                i=i+1
            return 'ko'
        else:
            return 'ko'

    def connexion(self, identifiant, password):
        file = open('user.txt')
        lines = file.readlines()
        for line in lines:
            line_split = line.split(',')
            #print("{},{} ==> {},{}".format(identifiant,password,line_split[0],line_split[6]))
            if int(identifiant) == int(line_split[0]) and password == line_split[6]:
                #print('id ok + password ok')
                self.connecte = True
                return {'id':line_split[0],'prenom':line_split[1],'nom':line_split[2],
                'role':line_split[3],'pres':line_split[4],'mail':line_split[5],'mdp':line_split[6]}
            else:
                continue
    mdp = property(fget = get_mot_de_passe, fset = set_mot_de_passe)
    nom = property(fget = get_nom, fset = set_nom)

