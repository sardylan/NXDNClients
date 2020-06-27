#!/bin/bash

git log -1 |
  head -n 1 |
  awk -F' ' '{print substr($2, 1, 8)}'
