#!/bin/bash

function f_prt_test()
{
    echo -e "\n*****launching tests with new READ_SIZE macro*****"
    echo -e  "************* $1 - $2 / Simple tests ************\n"
}

function f_p_READ_SIZE()
{
    echo "---------------READ SIZE VALUE = $1---------------"
}

function f_gcc()
{
    rm get_next_line.h
    touch get_next_line.h
    echo -e "#define READ_SIZE $i\n#include <stdlib.h>\n#include <stdio.h>\n#include <unistd.h>" > get_next_line.h
    man man man > test
    gcc get_next_line.h get_next_line.c
}

f_prt_test 1 25
for i in {1..25}
do
    f_p_READ_SIZE $i
    f_gcc
    ./a.out test > result
    echo -e "\ndiff results : "
    diff -q test result
    echo -e "\n"
done

f_prt_test 50 110
for i in {50..110}
do
    f_p_READ_SIZE $i
    f_gcc
    ./a.out test > result
    echo -e "\ndiff results : "
    diff -q test result
    echo -e "\n"
done

f_prt_test BIG
for i in 100 200 300 400 500 600 700 800 900 1000
do
    f_p_READ_SIZE $i
    f_gcc
    ./a.out test > result
    echo -e "\ndiff results : "
    diff -q test result
    echo -e "\n"
done


f_prt_test BIG 2
for i in 1000 10000 100000
do
    f_p_READ_SIZE $i
    f_gcc
    ./a.out test > result
    echo -e "\ndiff results : "
    diff -q test result
    echo -e "\n"
done
rm ./a.out get_next_line.h.gch result test

echo -e "\nFINISHED!"
