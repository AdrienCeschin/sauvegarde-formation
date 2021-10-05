import random
cards = list(range(1,11))
cards.append(V)
cards.append(Q)
cards.append(K)

club = cards
spade = cards
diamond = cards
heart = cards

fullGame1 = club+spade+diamond+heart
fullGame2 = club+spade+diamond+heart

print(fullGame1)
print(fullGame2)

hand1 = random.choices(fullGame1,k=10)
hand2 = random.choices(fullGame2,k=10)

print(hand1)
print(hand2)