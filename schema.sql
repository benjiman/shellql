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
    cast(json_extract(line,'$[0]') as integer) as _i0,
    cast(json_extract(line,'$[0]') as double) as _d0,
    json_extract(line,'$[1]') as _1, 
    cast(json_extract(line,'$[1]') as integer) as _i1,
    cast(json_extract(line,'$[1]') as double) as _d1,
    json_extract(line,'$[2]') as _2,
    cast(json_extract(line,'$[2]') as integer) as _i2,
    cast(json_extract(line,'$[2]') as double) as _d2,
    json_extract(line,'$[3]') as _3,
    cast(json_extract(line,'$[3]') as integer) as _i3,
    cast(json_extract(line,'$[3]') as double) as _d3,
    json_extract(line,'$[4]') as _4,
    cast(json_extract(line,'$[4]') as integer) as _i4,
    cast(json_extract(line,'$[4]') as double) as _d4,
    json_extract(line,'$[5]') as _5,
    cast(json_extract(line,'$[5]') as integer) as _i5,
    cast(json_extract(line,'$[5]') as double) as _d5,
    json_extract(line,'$[6]') as _6,
    cast(json_extract(line,'$[6]') as integer) as _i6,
    cast(json_extract(line,'$[6]') as double) as _d6,
    json_extract(line,'$[7]') as _7,
    cast(json_extract(line,'$[7]') as integer) as _i7,
    cast(json_extract(line,'$[7]') as double) as _d7,    
    json_extract(line,'$[8]') as _8,
    cast(json_extract(line,'$[8]') as integer) as _i8,
    cast(json_extract(line,'$[8]') as double) as _d8,
    json_extract(line,'$[9]') as _9,
    cast(json_extract(line,'$[9]') as integer) as _i9,
    cast(json_extract(line,'$[9]') as double) as _d9,
    json_extract(line,'$[10]') as _10,
    cast(json_extract(line,'$[10]') as integer) as _i10,
    cast(json_extract(line,'$[10]') as double) as _d10,
    json_extract(line,'$[11]') as _11,
    cast(json_extract(line,'$[11]') as integer) as _i11,
    cast(json_extract(line,'$[11]') as double) as _d11,
    json_extract(line,'$[12]') as _12,
    cast(json_extract(line,'$[11]') as integer) as _i12,
    cast(json_extract(line,'$[12]') as double) as _d12,
    json_extract(line,'$[13]') as _13,
    cast(json_extract(line,'$[13]') as integer) as _i13,
    cast(json_extract(line,'$[13]') as double) as _d13,
    json_extract(line,'$[14]') as _14,
    cast(json_extract(line,'$[14]') as integer) as _i14,
    cast(json_extract(line,'$[14]') as double) as _d14,
    json_extract(line,'$[15]') as _15,
    cast(json_extract(line,'$[15]') as integer) as _i15,
    cast(json_extract(line,'$[15]') as double) as _d15,
    json_extract(line,'$[16]') as _16,
    cast(json_extract(line,'$[16]') as integer) as _i16,
    cast(json_extract(line,'$[16]') as double) as _d16,
    json_extract(line,'$[17]') as _17,
    cast(json_extract(line,'$[17]') as integer) as _i17,
    cast(json_extract(line,'$[17]') as double) as _d17,
    json_extract(line,'$[18]') as _18,
    cast(json_extract(line,'$[18]') as integer) as _i18,
    cast(json_extract(line,'$[18]') as double) as _d18,
    json_extract(line,'$[19]') as _19,
    cast(json_extract(line,'$[19]') as integer) as _i19,
    cast(json_extract(line,'$[19]') as double) as _d19,
    json_extract(line,'$[20]') as _20,
    cast(json_extract(line,'$[20]') as integer) as _i20,
    cast(json_extract(line,'$[20]') as double) as _d20,
    json_extract(line,'$[21]') as _21,
    cast(json_extract(line,'$[21]') as integer) as _i21,
    cast(json_extract(line,'$[21]') as double) as _d21,
    json_extract(line,'$[22]') as _22,
    cast(json_extract(line,'$[22]') as integer) as _i22,
    cast(json_extract(line,'$[22]') as double) as _d22,
    json_extract(line,'$[23]') as _23,
    cast(json_extract(line,'$[23]') as integer) as _i23,
    cast(json_extract(line,'$[23]') as double) as _d23,
    json_extract(line,'$[24]') as _24,
    cast(json_extract(line,'$[24]') as integer) as _i24,
    cast(json_extract(line,'$[24]') as double) as _d24,
    json_extract(line,'$[25]') as _25,
    cast(json_extract(line,'$[25]') as integer) as _i25,
    cast(json_extract(line,'$[25]') as double) as _d25,
    json_extract(line,'$[26]') as _26,
    cast(json_extract(line,'$[26]') as integer) as _i26,
    cast(json_extract(line,'$[26]') as double) as _d26,
    json_extract(line,'$[27]') as _27,
    cast(json_extract(line,'$[27]') as integer) as _i27,
    cast(json_extract(line,'$[27]') as double) as _d27,
    json_extract(line,'$[28]') as _28,
    cast(json_extract(line,'$[28]') as integer) as _i28,
    cast(json_extract(line,'$[28]') as double) as _d28,
    json_extract(line,'$[29]') as _29,
    cast(json_extract(line,'$[29]') as integer) as _i29,
    cast(json_extract(line,'$[29]') as double) as _d29,
    json_extract(line,'$[30]') as _30,
    cast(json_extract(line,'$[30]') as integer) as _i30,
    cast(json_extract(line,'$[30]') as double) as _d30,
    json_extract(line,'$[31]') as _31,
    cast(json_extract(line,'$[31]') as integer) as _i31,
    cast(json_extract(line,'$[31]') as double) as _d31
from json_stdin;

drop view if exists cols;
create view cols as select * from cols_stdin;
