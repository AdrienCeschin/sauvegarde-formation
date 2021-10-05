loremipsum = open('./vagrant/loremipsum.txt', 'r+')

loremipsum_content_lines = loremipsum.readlines()

loremipsum_content_lines_part1 = loremipsum_content_lines[0:5]
loremipsum_content_lines_part2 = loremipsum_content_lines[5:]

#loremipsum_newContent_lines = loremipsum_content_lines_part1 + ['\nMa nouvelle chaine insérée dans mon fichier texte au milieu du lorem ipsum.\n'] + loremipsum_content_lines_part2
loremipsum_newContent_lines = loremipsum_content_lines.insert(4, '\nMa nouvelle chaine insérée dans mon fichier texte au milieu du lorem ipsum.\n')
loremipsum.seek(0)
loremipsum.writelines(loremipsum_newContent_lines)
loremipsum.close()