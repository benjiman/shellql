drop view if exists psaux;
create view psaux as 
select 
    _0 as user,
    _1 as pid,
    _d2 as cpu,
    _d2 as perc_cpu, 
    _d3 as mem,
    _d3 as perc_mem,
    _i4 as vsz,
    _i5 as rss,
    _6 as tty,
    _7 as stat,
    _8 || _9 as start_time,
    coalesce(_10,'') || ' ' || coalesce(_11,'') || ' ' || coalesce(_12,'') || ' ' || coalesce(_13,'') || ' ' || coalesce(_13,'') || ' ' || coalesce(_14,'') || ' ' || coalesce(_15,'') || ' ' || coalesce(_16,'') || ' ' || coalesce(_17,'') || ' ' || coalesce(_18,'') || ' ' || coalesce(_19,'') || ' ' || coalesce(_20,'') || ' ' || coalesce(_21,'') || ' ' || coalesce(_22,'') || ' ' || coalesce(_23,'') || ' ' || coalesce(_24,'') || ' ' || coalesce(_25,'') || ' ' || coalesce(_26,'') || ' ' || coalesce(_27,'') || ' ' || coalesce(_28,'') || ' ' || coalesce(_29,'') || ' ' || coalesce(_30,'')  || ' ' || coalesce(_31,'') as command,
    _10 as executable
from cols
WHERE _0 != 'USER';
    
