drop view if exists lsl;
create view lsl as 
select 
    _0 as permissions, 
    _i1 as link_count, 
    _2 as owner, 
    _3 as `group`, 
    _i4 as file_size, 
    _6 || ' ' || _7 as timestamp, 
    _8 as filename,
    substr(_0,1,1) as permissions_type,
    case when substr(_0,1,1) = 'd' then true else false end as directory,
    case when substr(_0,2,1) != '-' then true else false end as permissions_user_read,
    case when substr(_0,3,1) != '-' then true else false end as permissions_user_write,
    case when substr(_0,4,1) != '-' then true else false end as permissions_user_execute,
    case when substr(_0,5,1) != '-' then true else false end as permissions_group_read,
    case when substr(_0,6,1) != '-' then true else false end as permissions_group_write,
    case when substr(_0,7,1) != '-' then true else false end as permissions_group_execute,
    case when substr(_0,8,1) != '-' then true else false end as permissions_others_read,
    case when substr(_0,9,1) != '-' then true else false end as permissions_others_write,
    case when substr(_0,10,1) != '-' then true else false end as permissions_others_execute
from cols_stdin
WHERE _0 != 'total';
