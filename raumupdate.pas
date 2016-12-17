unit RaumUpdate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTraum,MTenemy;
procedure RaumUpdate(EigenerRaum:TRAum;Nord:TRAum;Sued:TRAum;West:TRAum;Ost:TRAum;Gegner:TEnemy);

implementation
   //Benötigte Units zum Funktioniern
procedure RaumUpdate(EigenerRaum:TRAum;Nord:TRAum;Sued:TRAum;West:TRAum;Ost:TRAum;Gegner:TEnemy);
 begin
EigenerRaum.Norden:=Nord;
EigenerRaum.Osten:=Ost;
EigenerRaum.Sueden:=Sued;
EigenerRaum.Westen:=West;
EigenerRaum.Enemy:=Gegner;
  end;
end.

