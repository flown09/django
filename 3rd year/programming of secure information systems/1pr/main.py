"""
Option 4
P = 10^-7
V = 11pass/min
T = 6 days
"""

from math import ceil
import string
import random

def generate_password(length, characters):
    lower = random.choice(string.ascii_lowercase)
    upper = random.choice(string.ascii_uppercase)
    digit = random.choice(string.digits)
    special = random.choice(string.punctuation)

    remaining = ''.join(random.choice(characters) for _ in range(length - 4))
    password = list(lower + upper + digit + special + ''.join(remaining))
    random.shuffle(password)
    return ''.join(password)


if __name__ == '__main__':
    P = 10**(-7)
    V = 11
    T = 6
    S_star = ceil(V * 60 * 24 * T / P)
    A = string.ascii_letters + string.digits + string.punctuation
    A_power = len(A)
    L = 1

    while S_star >= A_power**L:
        L += 1

    print(f'Минимальная длина пароля: {L}')
    print(f'Сгенерированный пароль: {generate_password(L, A)}')
