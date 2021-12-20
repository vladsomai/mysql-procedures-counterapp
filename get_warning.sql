drop procedure if exists getWarning;

delimiter //
CREATE PROCEDURE getWarning(adapter_codeParam int, fixture_typeParam VARCHAR(30))
BEGIN
if (select exists(select * from projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then
select warning_at from projects 
where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;
else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code does not exist with the specified fixture type!', MYSQL_ERRNO = 1001;
end if;
END;
//
delimiter ;

call getWarning(1707, "ICT");

