class Utilisateur:
    id = 0
    prenom = ""
    _nom = ""
    role = ""
    presentation = ""
    email = ""
    __mot_de_passe = "" # private mot_de_passe
    connecte = False

    def __init__(self, dic):
        self.id = dic['id']
        self._nom = dic['nom']
        self.prenom = dic['prenom']
        self.__mot_de_passe = dic['mot_de_passe']
        self.role = dic['role']
        self.presentation = dic['presentation']
        self.email = dic['email']
        self.is_admin = dic['is_admin']

    def get_nom(self):
        return self._nom.upper()

    def set_nom(self, valeur):
        self._nom = "ma regle a moi " + valeur

    def get_mot_de_passe(self):
        nb_char = len(self.__mot_de_passe)
        res = '*'*nb_char
        return res

    def set_mot_de_passe(self,valeur):
        res = 1
        if not len(valeur) < 8:
            valeur.lower()
            has_letter = False
            has_number = False
            numbers = "0123456789"
            letters = "abcdefghijklmnopqrstuvwxyz"
            for c in valeur:
                if c in numbers and not has_number:
                    has_number = True
                if c in letters and not has_letter:
                    has_letter = True
            if has_letter and has_number:
                self.__mot_de_passe = valeur
                res = 0
            else:
                print("Please use a password with at least one letter and one number.")
        else:
            print("Please use a password with more than 8 characters.")

    def connexion(self, identifiant, password):
        file = open('utilisateurs.txt')
        lines = file.readlines()
        for line in lines:
            line_split = line.split(',')
            if identifiant == line_split[0] and password == line_split[6]:
                print('id ok + password ok')
                self.connecte = True
                return create_user_session(line)
            else:
                continue
        file.close()
        print('No account matches these credentials.')
        return Utilisateur()
    
    def create_user_session(self,user_info):
        user_info_split = user_info.split(',')
        user_info_dic = {'id':user_info_split[0],'nom':user_info_split[1],'prenom':user_info_split[2],'role':user_info_split[3],'presentation':user_info_split[4],'email':user_info_split[5],'mot_de_passe':user_info_split[6]}
        if user_info_dic['role'] == 'admin':
            return Admin(user_info_dic)
        else:
            return Membre(user_info_dic)
    
    nom = property(fget = get_nom, fset = set_nom)
    __mot_de_passe = property(fget = get_mot_de_passe, fset = set_mot_de_passe)