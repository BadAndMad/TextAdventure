unit ProzedureRaumwechsel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum,KampfProzedure;
var
 aktuellerRaum: TRaum;
 vorherigerRaum: TRaum;
procedure RaumWechsel(Eingabe:Traum);
implementation
uses Unit1,UIRefresh;
procedure RaumWechsel(Eingabe:Traum);
   begin
   if Eingabe = nil        //Prozedur wird mit Eingabe als Nördlicher Raum übergeben
   then Form1.Memo1.lines.add('Da ist kein Raum!')
   else
     if IstInKampf = true  then
     begin
     Form1.Memo1.lines.add('Du bist in einem Kampf und kannst nur flüchten oder Angreifen')
     end
     else
     begin
      if uppercase(Unit1.Eingabe) = 'NORDEN' then
      Form1.Memo1.lines.add(aktuellerRaum.NORDENLeave)
      else if uppercase(Unit1.Eingabe) = 'OSTEN' then
      Form1.Memo1.lines.add(aktuellerRaum.OSTENLeave)
      else if (uppercase(Unit1.Eingabe) = 'SÜDEN') or   (uppercase(Unit1.Eingabe) = 'SUEDEN') then
      Form1.Memo1.lines.add(aktuellerRaum.SUEDENLeave)
      else if uppercase(Unit1.Eingabe) = 'WESTEN' then
      Form1.Memo1.lines.add(aktuellerRaum.WESTENLeave);
      vorherigerRaum:=aktuellerRaum;
      aktuellerRaum:=Eingabe;
      Form1.Memo1.lines.add('Du betritts: '+Eingabe.Raumname);

      if AktuellerRaum.Enemy <> nil then
      begin
      IstInKampf:=true;
      AktuellerGegner:=AktuellerRaum.Enemy;
      SpielerRK:=SPielerRK -2;
      SpielerATK:=SPielerATK -2;
      Kampf();                      //Ersatz für das Initative System
      SpielerATK:=SPielerATK +2;    //Bei Betreten eines Raumes mit einem Gegner
      SpielerRK:=SpielerRK +2;      //Wird dem Spieler 2 RK abgezogen
      UIRefresh.UIRefresh();
      end;
  end;
end;

end.

