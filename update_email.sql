drop procedure if exists updateEmail;

delimiter //
CREATE PROCEDURE updateEmail(adapter_codeParam int, fixture_typeParam VARCHAR(30), owner_emailParam varchar(50), modified_byParam VARCHAR(50))
BEGIN
if (select exists(select * from projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then
update projects 
set owner_email = owner_emailParam,
    modified_by = modified_byParam,
    last_update = now()
where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;
else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code does not exist with the specified fixture type!', MYSQL_ERRNO = 1001;
end if;

END;
//
delimiter ;

call updateEmail(1704, "FCT", "vlad.somai@conti.com", "vladsomai@continental.com");

