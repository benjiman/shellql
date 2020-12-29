drop view if exists df;
create view df as 
select 
    _0 as filesystem, 
    cast(_1 as integer) as blocks, 
    cast(_2 as integer) as used,
    cast(_3 as integer) as available, 
    cast(rtrim(_4,'%') as real) as used_percentage, 
    _5 as mounted_on
from cols_stdin where filesystem != 'Filesystem';
