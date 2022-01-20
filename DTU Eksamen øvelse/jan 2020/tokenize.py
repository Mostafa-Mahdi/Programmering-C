def tokenize(text):
    text = text.replace("c'h", "ch")
    text = text.replace("'", " ")
    words = text.split()
    return len(words)
