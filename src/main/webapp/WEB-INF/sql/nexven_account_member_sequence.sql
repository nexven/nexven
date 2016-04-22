
rem nexven account & sequence


grant connect,resource,unlimited tablespace to nexven identified by nexven123;
alter user nexven default tablespace users;
alter user nexven temporary tablespace temp;
connect nexven/nexven123

create sequence mem_seq;

rem 디비 구조는 nexven.sql을 execute
rem BOARD 더미 파일 BOARD_test_data_20160422_30_57.txt
rem GAMEDB 더미 파일 GAMEDB_test_data_20160420_58_04.txt 