#!/bin/bash

mysql < init.sql

mysqladmin -u root -p shutdown
