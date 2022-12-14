#!/bin/bash

# Lint
clang-format -i main.c

# Cleanup
rm -f ./ochrs
rm -rf ../site
mkdir ../site

# Linux(debug)
cc -std=c89 -DDEBUG -Wall -Wno-unknown-pragmas -Wpedantic -Wshadow -Wuninitialized -Wextra -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=int-conversion -Wvla -g -Og -O0 -fsanitize=address -fsanitize=undefined main.c -o ochrs

# Linux(fast)
#cc main.c -std=c89 -Os -DNDEBUG -g0 -s -Wall -Wno-unknown-pragmas -o ochrs

# Valgrind
# gcc -std=c89 -DDEBUG -Wall -Wpedantic -Wshadow -Wuninitialized -Wextra -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=int-conversion -Wvla -g -Og main.c -o oscean
# valgrind ./oscean

# Build Size
 echo "$(du -b ./ochrs | cut -f1) bytes written"

# Run
gdb ./ochrs
