#!/bin/bash
systemctl is-active --quiet bench.service && systemctl is-enabled --quiet bench.service
