unit sterben;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure Sterben();

implementation

uses Unit1,UIRefresh,ProzedureRaumwechsel,KampfProzedure;   //Benötigte Units zum Funktioniern
procedure sterben();
 begin
  IstInKampf:=false;
  Form1.Memo1.lines.add('Du bist gestorben!');
  aktuellerRaum:=AnfangsRaum;
  SpielerHP:=AnfangsHP;
  SpielerRK:=AnfangsRK;
  SpielerAtk:=AnfangsAtk;
  UIRefresh.UIRefresh();
  end;
end.

