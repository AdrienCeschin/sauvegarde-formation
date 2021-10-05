#open the file containing the notes to posttreat
file = open('./vagrant/notes.txt', 'r')

#store the notes in a list as float values
notes = []
for note in file.readlines():
    notes.append(float(note))

#close the file
file.close()

#evaluate the average note
moy = sum(notes)/len(notes)

#print the average note
print("La moyenne est de :")
print("%.2f" % moy)

#open the file in which we will store the notes and the corresponding mention, create it if it does not exist
file2 = open('./vagrant/notes2.txt', 'w+')

#for each note write on a new line the note and the mention
for note in notes:
    file2.write("%.1f" % note)
    if note<10:
        file2.write(" recale \n")
    else:
        file2.write(" admis \n")

#close the second file
file2.close()