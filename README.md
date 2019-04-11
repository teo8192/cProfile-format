# cProfile formatter

You can either pipe output of cProfile into ./format.sh

$ python3 -m cProfile -s tottime ./main.py | ./format.sh

or

$ python3 -m cProfile -s tottime ./main.py > cProfile.out
$ cat cProfile.out | ./format.sh

in the sencond method you can also inspect the cProfile output yourself to see how long it ran for and so on.
