def count_letter(word_list, letter):
    count = 0
    for word in word_list:
        for letters in word:
            if letter in letters:
                count += 1
    return count
    


words = ['python', 'c++', 'cc', 'scala', 'java']
letter = "c"
result = count_letter(words, letter)
print(result)