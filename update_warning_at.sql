drop procedure if exists updateWarning;

delimiter //
CREATE PROCEDURE updateWarning(adapter_codeParam int, fixture_typeParam VARCHAR(30), warning_atParam int, modified_byParam VARCHAR(50))
BEGIN

if (select exists(select * from projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then
update projects 
set warning_at = warning_atParam,
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

call updateWarning(1705, "FCT", 65000, "admin");

