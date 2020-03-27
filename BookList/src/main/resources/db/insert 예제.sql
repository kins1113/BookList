--insert 문이 저장된 sql문 
select * from HomeList;
select * from Categorie order by use_ck desc;
select * from addInfo;  
select * from addContent;
select * from userInfo;

insert into Categorie (CATE_NO,CATE_NAME,CATE_INFO, USE_ck)
values(Categorie_seq.nextval,'도서','집에있는 책들입니다.','n');

insert into HomeList(H_NO,H_NAME,H_PRICE,H_GETDATE,MAKER,DEL_CK,CATE_NO)
values (HomeList_seq.nextval,'눈마새',17000,sysdate,'이영도','x',9);
insert into HomeList(H_NO,H_NAME,H_PRICE,H_GETDATE,MAKER,DEL_CK,CATE_NO)
values (HomeList_seq.nextval,'피마새',20000,sysdate,'이영도','x',9);

commit;

update Categorie
set use_ck = 'y';
delete from Categorie;