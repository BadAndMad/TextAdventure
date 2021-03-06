unit RaumUpdate;

{$mode objfpc}{$H+}

interface

uses
  Classes,StdCtrls,ExtCtrls,SysUtils,mTraum;
procedure RaumUpdate(EigenerRaum:TRAum; Nord:TRAum; Ost:TRAum; Sued:TRAum; West:TRAum);
procedure RaumNamenUpdate(EigenerRaum:Traum; Nord:String; Ost:String; Sued:String; West:String);
procedure ZusaetzlicheUpdates(EigenerRaum:TRaum; Schwierigkeit:string; Mo_DE:Integer; Mo_De_Ad:Integer; Mo_De_Sub:Integer; Camp_pos:boolean);
procedure RaumMapUpdate(EigenerRaum:TRaum; SN:TShape; SO:TShape; SS:TSHape; SW:TShape; Location:TButton);
implementation
   //Benötigte Units zum Funktioniern
procedure RaumUpdate(EigenerRaum:TRAum;Nord:TRAum;Ost:TRAum;Sued:TRAum;West:TRAum);
 begin
EigenerRaum.Norden:=Nord;
EigenerRaum.Osten:=Ost;
EigenerRaum.Sueden:=Sued;
EigenerRaum.Westen:=West;
  end;
procedure RaumNamenUpdate(EigenerRaum:Traum;Nord:String;Ost:String;Sued:String;West:String);
 begin
EigenerRaum.NORDENLeave:=Nord;
EigenerRaum.OSTENLeave:=Ost;
EigenerRaum.SUEDENLeave:=Sued;
EigenerRaum.WESTENLeave:=West;
  end;
procedure ZusaetzlicheUpdates(EigenerRaum:TRaum;Schwierigkeit:string;Mo_DE:Integer;Mo_De_Ad:Integer;Mo_De_Sub:Integer;Camp_pos:boolean);
begin
   EigenerRaum.Difficulty:=Schwierigkeit;
   EigenerRaum.MD:=Mo_DE;
   EigenerRaum.MDA:=Mo_De_Ad;
   EigenerRaum.MDS:=Mo_De_Sub;
   EigenerRaum.Camp_possible:=Camp_pos;
  end;
procedure RaumMapUpdate(EigenerRaum:TRaum; SN:TShape; SO:TShape; SS:TSHape; SW:TShape; Location:TButton);
begin
   EigenerRaum.StrichNorden:=SN;
   EigenerRaum.StrichOsten:=SO;
   EigenerRaum.StrichSueden:=SS;
   EigenerRaum.StrichWesten:=SW;
   EigenerRaum.Ort:=Location;
  end;
end.

