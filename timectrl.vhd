LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY timectrl IS
PORT (clockt,resett: IN STD_LOGIC;
timeout:BUFFER STD_LOGIC);
END timectrl;

ARCHITECTURE arca OF timectrl IS
type timing is array (64 downto 0) of integer;
signal timeA : timing;
begin

timeA<=(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);

process (clockt,resett)
variable currentlength : integer:=65;

VARIABLE timecnt:INTEGER:=0;
variable timeflag:integer:=0;
begin
if resett='0' then timeout<='0';
elsif clockt'event and clockt='1' then
if timeflag=0 then timecnt:=timecnt+1; timeflag:=1; timeout<='1';
elsif timeflag=1 then
timeout<='0';
if timecnt>timeA(currentlength) then timecnt:=0;currentlength:=currentlength-1; timeflag:=0;
elsif timecnt=timeA(currentlength) then timecnt:=0;currentlength:=currentlength-1; timeflag:=0;
elsif timecnt<timeA(currentlength) then timecnt:=timecnt+1;

end if;
end if;
end if;
end process;
end architecture arca;