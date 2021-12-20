drop procedure if exists getLimit;

delimiter //
CREATE PROCEDURE getLimit(adapter_codeParam int, fixture_typeParam VARCHAR(30))
BEGIN
if (select exists(select * from projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then
select contacts_limit from projects 
where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;
else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code does not exist with the specified fixture type!', MYSQL_ERRNO = 1001;
end if;
END;
//
delimiter ;

call getLimit(1705, "FCT");

