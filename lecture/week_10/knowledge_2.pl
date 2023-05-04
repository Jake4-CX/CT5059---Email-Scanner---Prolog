red(apple_1).
red(block_1).
red(car_27).

car(desoto_48).
car(edsel_57).

bike(harley).

blue(bag).
blue(harley).

fun(X):- red(X), car(X).
fun(X):- blue(X), bike(X).