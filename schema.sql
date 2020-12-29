create table stdin(line text);

drop view if exists json_stdin;
create view json_stdin as 
with recursive split(value, str,orig) AS (
    SELECT null, line || ' ',line as orig from stdin
    union all
    select
    substr(str, 0, instr(str, ' ')),
    substr(str, instr(str, ' ')+1), orig
    from split where str!=''
) 
select json_group_array(value) as line 
from split 
where value is not null and value != '' 
group by orig;

drop view if exists cols_stdin;
create view cols_stdin as 
select 
    json_extract(line,'$[0]') as _0, 
    json_extract(line,'$[1]') as _1, 
    json_extract(line,'$[2]') as _2,
    json_extract(line,'$[3]') as _3,
    json_extract(line,'$[4]') as _4,
    json_extract(line,'$[5]') as _5,
    json_extract(line,'$[6]') as _6,
    json_extract(line,'$[7]') as _7,
    json_extract(line,'$[8]') as _8,
    json_extract(line,'$[9]') as _9,
    json_extract(line,'$[10]') as _10,
    json_extract(line,'$[11]') as _11,
    json_extract(line,'$[12]') as _12,
    json_extract(line,'$[13]') as _13,
    json_extract(line,'$[14]') as _14,
    json_extract(line,'$[15]') as _15,
    json_extract(line,'$[16]') as _16,
    json_extract(line,'$[17]') as _17,
    json_extract(line,'$[18]') as _18,
    json_extract(line,'$[19]') as _19,
    json_extract(line,'$[20]') as _20,
    json_extract(line,'$[21]') as _21,
    json_extract(line,'$[22]') as _22,
    json_extract(line,'$[23]') as _23,
    json_extract(line,'$[24]') as _24,
    json_extract(line,'$[25]') as _25,
    json_extract(line,'$[26]') as _26,
    json_extract(line,'$[27]') as _27,
    json_extract(line,'$[28]') as _28,
    json_extract(line,'$[29]') as _29,
    json_extract(line,'$[30]') as _30,
    json_extract(line,'$[31]') as _31
from json_stdin;
