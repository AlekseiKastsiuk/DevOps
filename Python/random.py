import random

def generate_random_list():
    i=0
    random_list = []
    while i != 5 and len(random_list) < 7:
        i = random.randint(1, 10)
        random_list.append(i)
    return random_list

def some_task():
    new_random_list=generate_random_list()
    print(new_random_list)
    for i in range(len(new_random_list)):
        new_random_list[i] += 10

    return new_random_list

print(some_task())