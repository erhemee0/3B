from textblob import TextBlob

sentence = "Ultra shorts - Our ever-popular long-cut, quick-drying Ultra Shorts use lightweight 50- denier polyester ripstop with a wicking finish to stay cool and comfortable, mile after mile. Pockets: two front drop-ins, two large"
ngram_object = TextBlob(sentence)
ngrams = ngram_object.ngrams(n=2)
print(ngrams)
print('---------------------------------------------------------------------------------------')
ngrams = ngram_object.ngrams(n=3)
print(ngrams)