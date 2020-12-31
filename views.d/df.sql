drop view if exists df;
create view df as 
select 
    _0 as filesystem, 
    _i1 as blocks, 
    _i2 as used,
    _i3 as available, 
    cast(rtrim(_4,'%') as real) as used_percentage, 
    _5 as mounted_on
from cols_stdin where filesystem != 'Filesystem';
