import mini_maxi
import pair_impair

def longest_string():
    input_value = mini_maxi.ask_input()
    mini_maxi.give_answer(input_value[0],input_value[1])

def even_odd() :
    pair_impair.give_answer(pair_impair.ask_input())

def basic_loop() :
    value_type = input('Please tell us what kind of value you want to work on. s for string or i for integer: ')

    if value_type == 's':
        longest_string()
    elif value_type == 'i':
        even_odd()
    else :
        print('The value you entered does not correspond to s or i. Please answer accordingly now if you to exit this loop.')
        basic_loop()

basic_loop()