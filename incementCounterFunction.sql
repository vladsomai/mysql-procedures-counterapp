drop function if exists incrementCounter;

delimiter //
CREATE function incrementCounter(adapter_codeParam int, fixture_typeParam VARCHAR(30))
returns int
BEGIN

if (select exists(select * from projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then

update projects 
set contacts = contacts + 1
where adapter_code = adapter_codeParam and fixture_type = fixture_typeParam;

return 0;
else
return -1;
end if;

return -2;

END;
//
delimiter ;

select incrementCounter(1704, "FCT");

/*
call incrementCounter(1705, "FCT");
call incrementCounter(1706, "ICT");
call incrementCounter(1707, "ICT");
*/