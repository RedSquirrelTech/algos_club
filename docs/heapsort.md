# Heap Helpers

Turning the array into a heap such that an array of `[9, 0, 1, 8, 2, 7, 3, 6, 4, 5]` becomes a tree that looks like:

```
                                 9
                              /     \
                            0         1
                         /    \      /   \
                       8        2   7      3
                     /   \     /
                    6     4   5

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
