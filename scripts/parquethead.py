#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Authors:     MG
# Maintainers: MG
# License:     2020, HRDAG, GPL v2 or later
# ===========================================
# parquethead.py

import sys
import pandas as pd

parquet = pd.read_parquet(sys.argv[1])
try:
    parquet = parquet.iloc[:int(sys.argv[2])]
except IndexError:
    parquet = parquet.iloc[:10]
to_print = parquet.to_csv(sep='|', index=False)
print(to_print)

# done.
