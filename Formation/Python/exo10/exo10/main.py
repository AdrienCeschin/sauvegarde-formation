from user import user
from admin import admin
from membre import membre

dico = {'id':'','prenom':'','nom':'','role':'','pres':'','mail':'','mdp':''}
u = user(dico)
#print(u.connecte)
print("Bonjour, Veuillez vous identifier")
_id = int(input("Veuillez Saisir votre identifiant: "))
psw = input("Veuillez Saisir votre Mot De Passe: ")

dico = u.connexion(_id,psw)
print(u.connecte)

if u.connecte == False:
    print("Echec de connection")
else:
    if dico['role']=='membre':
        m=membre(dico)
        m.connecte=True
        choix = m.menu()
        if choix =="y":
            _id = m.id
            _prenom = input("Prenom: ")
            _nom = input("Nom: ")
            _role =input("Role: ")
            _presentation =input("Presentation: ")
            _email = input("Mail: ")
            _mdp = input("PSW: ")
            if u.checkMdp(_mdp) == 'ok' :
                dico = {'id':_id,'prenom':_prenom,'nom':_nom,'role':_role,'pres':_presentation,'mail':_email,'mdp':_mdp}
                m.update(dico)
            else:
                print("mdp invalide")
            
        else :
            print("choix non compris")
    else :
        a=admin(dico)
        a.connecte=True
        choix = a.menu()
        if choix == "1":
            a.addUser()
        elif choix == "2":
            a.delUser()
        else :
            print("choix non compris")
        
