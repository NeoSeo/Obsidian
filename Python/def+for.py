def temp(a,b):
    x = list()
    if type(a) == str:
        if type(b) == int:
            for i in range(b):
                x.append(a)

            return x
temp('ok',4)
## -> [ok, ok, ok, ok]
