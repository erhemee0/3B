import collections


sentence = "Ultra shorts - Our ever-popular long-cut, quick-drying Ultra Shorts use lightweight 50- denier polyester ripstop with a wicking finish to stay cool and comfortable, mile after mile. Pockets: two front drop-ins, two large"
words_list = sentence.split(" ")
unique_words = set(words_list)
for word in unique_words:
    print(word, words_list.count(word))