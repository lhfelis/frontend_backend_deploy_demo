import sys
import MySQLdb

db = MySQLdb.connect(host=sys.argv[1], port=int(sys.argv[2]), user=sys.argv[3], passwd=sys.argv[4])
db.cursor().execute("create database {};".format(sys.argv[5]))