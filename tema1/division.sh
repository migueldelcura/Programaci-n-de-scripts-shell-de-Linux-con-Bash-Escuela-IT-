#!/bin/bash
let a=25
let b=33
division=$(echo "scale=2; $a/$b" | bc)
echo El resultado es $division
