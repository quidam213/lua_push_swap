# lua_push_swap

Recode of the push_swap project in Lua 5.4, with a radix sort and unit tests.

### The rules

You have two stacks, `a` and `b`.
At the start, `a` contains the numbers to sort (all different) and `b` is empty.
The goal is to sort `a` in ascending order, the smallest number on top, using only these instructions:

| Instruction | Effect |
| ----------- | ------ |
| `sa`  | swap the first two elements of a. |
| `sb`  | swap the first two elements of b. |
| `ss`  | `sa` and `sb` at the same time. |
| `pa`  | take the first element of b and put it on top of a. |
| `pb`  | take the first element of a and put it on top of b. |
| `ra`  | rotate a, the first element becomes the last. |
| `rb`  | rotate b, the first element becomes the last. |
| `rr`  | `ra` and `rb` at the same time. |
| `rra` | reverse rotate a, the last element becomes the first. |
| `rrb` | reverse rotate b, the last element becomes the first. |
| `rrr` | `rra` and `rrb` at the same time. |

An instruction that cannot be done (empty stack, less than two elements) does nothing.

### How to use it ?

You only need Lua 5.4.

Clone the repository or download it, then give the numbers to sort as arguments.

```
> lua Main.lua 4 3 2 1
4 3 2 1
19
pb ra pb ra pa pa pb ra ra pb pa pa ra pb pb pb pa pa pa
```

The output is made of 3 lines :

- the list given at the start.
- the number of instructions.
- the instructions, in order.

Negative numbers are accepted.

```
> lua Main.lua 10 23 -28 262 574 52 1 -3 4 -43 3643 34
```

### How does it work ?

The sort is a radix sort (LSD) on the bits of the numbers.

1. If there are negative numbers, every value is shifted so the smallest one is 0. The values are restored at the end.
2. For each bit, from the lowest to the highest, every number of `a` is checked once : if its bit is 0, `pb` sends it in `b`, if it is 1, `ra` keeps it in `a`.
3. Then `pa` brings everything back from `b` to `a`.

Each pass is stable, so the order of the previous passes is kept.
After the last bit, `a` is sorted and `b` is empty.

This algorithm only uses `pb`, `ra` and `pa`.

### Tests

The unit tests use luaunit, the file is already in the repository.

```
> lua RunTests.lua                # run all the tests
> lua RunTests.lua -p TestPile    # run only one test class
> lua TestPile.lua -v             # run one file, with details
```

### Project structure

```
> tree
.
├── Algorithm.lua       # base class of the algorithms
├── Logger.lua          # records the instructions done during the sort
├── luaunit.lua         # unit test library
├── Main.lua            # entry point, parses the arguments, runs the sort, prints the result
├── Parser.lua          # checks the arguments and turns them into a list of numbers
├── Pile.lua            # the stack (add, pop, swap, rotate, reverse rotate...)
├── Pushswap.lua        # the two stacks a and b and the 11 instructions
├── Radix.lua           # the radix sort, inherits from Algorithm
├── README.md
├── RunTests.lua        # runs all the tests
├── TestLogger.lua
├── TestPile.lua
├── TestPushswap.lua
└── TestRadix.lua
```

### Possible improvements

The radix works on the values, so the number of passes depends on the biggest number and not on the number of elements.
For 100 random numbers up to 2^31 it needs about 4700 instructions, where about 1100 are enough with ranks.
Replace each value by its rank (0 to n-1) before sorting.

Handle the small lists (2 to 5 elements) by hand, the radix wastes instructions on them.

Remove the `pb` directly followed by a `pa` in the log, they cancel each other.

Merge `sa` + `sb` in `ss`, `ra` + `rb` in `rr` and `rra` + `rrb` in `rrr`.
The radix never does it, but it would help with other algorithms.

A visualizer, as a separate program, which reads the output and plays the instructions one by one on the two stacks.

### Author

dam, github : quidam213
