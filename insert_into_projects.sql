drop procedure if exists insertProject;

delimiter //
CREATE procedure insertProject(project_nameParam varchar(30), adapter_codeParam INT, fixture_typeParam VARCHAR(30), owner_emailParam varchar(50), contacts_limitParam int, warning_atParam int, modified_byParam VARCHAR(50))
BEGIN

if not(select exists(select* from projects where adapter_code=adapter_codeParam and fixture_type=fixture_typeParam)) then

insert into projects (project_name, adapter_code, fixture_type, owner_email, contacts_limit, warning_at, modified_by, last_update) values
(
project_nameParam,
adapter_codeParam,
fixture_typeParam,
owner_emailParam,
contacts_limitParam,
warning_atParam,
modified_byParam,
now()
);

else
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The adapter code already exists with the specified fixture type!', MYSQL_ERRNO = 1002;
end if;

END;
//
delimiter ;


call insertProject("PSA_LHD",1704,"ICT","vlad.somai@continental.com", 45600, 45000, "vlad.somai@continental.com");
call insertProject("PSA_LHD",1730,"FCT","vlad.somai@continental.com", 45600, 45000, "vlad.somai@continental.com");
call insertProject("PSA_RHD",1705,"FCT","vlad.somai@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("C-HUD",  1706,"ICT","vlad.somai@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("SilverboxN293",1707, "ICT","vlad.somai@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("RenaultM0",1708,"ICT","vlad.somai@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("VW_FPK",1709,"ICT","adrian.blaan@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("VW_FPK",1710,"ICT","adrian.balan@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("VW_FPK",1711,"ICT","adrian.balan@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("BMW_CID_LHD",1712,"ICT","alex.grecu@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("BMW_CID_RHD",1713,"ICT","alex.grecu@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("BMW_DFE_LHD",1714,"ICT","alex.grecu@continental.com", 50000, 45000, "vlad.somai@continental.com");
call insertProject("BMW_DFE_RHD",1715,"ICT","alex.grecu@continental.com", 50000, 45000, "vlad.somai@continental.com");
