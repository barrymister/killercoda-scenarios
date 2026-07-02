#!/bin/bash
# queue should have no jobs left
[ -z "$(squeue -h -o %i 2>/dev/null)" ]
