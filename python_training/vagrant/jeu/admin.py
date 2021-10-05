class Admin(Utilisateur):

    def __init__(self,dic):
        Utilisateur(dic)

    def ajoutMembre(self) :
        new_member = '\n'
        new_member = new_member + str(input('What is the id of the member ? '))
        new_member = new_member + ', ' + str(input('What is the name of the member ? '))
        new_member = new_member + ', ' + str(input('What is the surname the member ? '))
        new_member = new_member + ', ' + str(input('What is the role of the member ? '))
        new_member = new_member + ', ' + str(input('What is the presentation of the member ? '))
        new_member = new_member + ', ' + str(input('What is the email of the member ? '))
        new_member = new_member +', ' + str(input('What is the password of the member ? '))
        file_members = open('./vagrant/jeu/utilisateur.txt','r+')
        file_members.read()
        file_members.write(new_member)
        file_members.close()

    def supprimeMembre(self,id):
        file_members = open('./vagrant/jeu/utilisateur.txt','r')
        membres = file_members.readlines()
        file_members.close()
        file_members = open('./vagrant/jeu/utilisateur.txt','w')
        for jeu in jeux :
            member_id = str(jeu).split(',')[0]
            if member_id != id :
                file_members.writelines(jeu)
        file_members.close()


