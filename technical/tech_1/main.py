

def detect_initiate(data = "3 3 3 3 3 4 3 2 2 2"): 
    data_split = data.split(" ")
    initiator = int(data_split[0])
    i = 1 
    for price in data_split[1:]:
        price = int(price)
        if price < initiator:
            return i
        i += 1    
    return 0 

detect_initiate("3 3 3 4 234 34 1")


# Noted
# proses pengerjaan tidak menggunakan chatGPT
