drop database link site1;


create database link site1
 connect to system identified by "123456"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.84.129)
		 (PORT = 1610))
       )
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  

