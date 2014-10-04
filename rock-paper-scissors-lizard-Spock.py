# The key idea of this program is to equate the strings
# "rock", "paper", "scissors", "lizard", "Spock" to numbers
# as follows:
# 0 - rock
# 1 - Spock
# 2 - paper
# 3 - lizard
# 4 - scissors

import random 

# helper functions
def name_to_number(name):
   if name == "rock":
        number = 0
   elif name == "Spock":
        number = 1
   elif name == "paper":
        number = 2
   elif name == "lizard":
        number = 3
   elif name == "scissors":
        number = 4
   else:
        print "Name does not match any of the five input strings!"
   return number

def number_to_name(number):
    if number == 0:
        name = "rock"
    elif number == 1:
        name = "Spock"
    elif number == 2:
        name = "paper"
    elif number == 3:
        name = "lizard"
    elif number == 4:
        name = "scissors"
    else:
        print "Number does not match any of the five input numbers!"
    return name

def rpsls(player_choice): 
    print("")
    player_number = name_to_number(player_choice)
    print 'Player chooses %s' %player_choice
    
    comp_number = random.randrange(0,5)
    comp_choice = number_to_name(comp_number)
    print 'Computer chooses %s' %comp_choice
    
    difference = (comp_number - player_number)%5
    if difference == 1 or difference == 2:
        print 'Computer wins!'
    elif difference == 3 or difference == 4:
        print 'Player wins!'
    else:
        print 'Player and Computer tie!'
    
# test your code - THESE CALLS MUST BE PRESENT IN YOUR SUBMITTED CODE
rpsls("rock")
rpsls("Spock")
rpsls("paper")
rpsls("lizard")
rpsls("scissors")
