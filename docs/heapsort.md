# Heap Helpers

Turning the array into a heap such that an array of `[5, 9, 2, 1, 0, 3, 8, 4, 7, 6`] becomes a tree that looks like:

```
                                 5
                              /     \
                            9         2
                         /    \      /   \
                       1        0   3      8
                     /   \     /
                    4     7   6

```

This can be done without the creation of a data structure by using the index
to create functions that calculate parents or left/right children.


```
                                 9
                              /     \
                            8         7
                         /    \      /   \
                       6        5   1      3
                     /   \     /
                    0     4   2

```
