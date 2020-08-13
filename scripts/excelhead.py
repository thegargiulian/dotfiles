#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Authors:     MG
# Maintainers: MG
# License:     2020, HRDAG, GPL v2 or later
# ===========================================
# excelhead.py

import sys
import pandas as pd

excel = pd.read_excel(sys.argv[1])
try:
    excel = excel.iloc[:int(sys.argv[2])]
except IndexError:
    excel = excel.iloc[:10]
to_print = excel.to_csv(sep='|', index=False)
print(to_print)

# done.
