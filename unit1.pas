unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RichMemo, mTRaum, MTEnemy, Kampfprozedure, ProzedureRaumWechsel, UIRefresh,mTLoot,LootDrop,
  RaumUpdate;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    LabelMDUnverwendet: TLabel;
    MD: TLabel;
    LabelRaumBeschreibung: TLabel;
    NotRichMemo1: TMemo;
    LabelGegnerHPunverwendet: TLabel;
    LabelGegnerHP: TLabel;
    LabelGegner: TLabel;
    Labeleingabeunverwendet: TLabel;
    LabelHPunverwendet: TLabel;
    LabelHP: TLabel;
    LabelRKunverwendet: TLabel;
    LabelRK: TLabel;
    LabelATKunverwendet: TLabel;
    LabelATK: TLabel;
    LabelRaum: TLabel;
    Memo1: TRichMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  //Räume//
  EmptyPreset:TRaum;
  Spinnennest:TRaum;
  Spinnenkammer:TRaum;
  Waldlichtung:TRaum;
  Hoehle:TRaum;
  Tautropfwald:TRaum;
  Weggabelung:TRaum;
  Hoehleneingang:TRaum;
  Lagerhalle:TRaum;
  Feuerschlot:TRaum;
  Abgrund_des_brennenden_Steins:TRaum;
  Waldweg:TRaum;
  Grosse_Blumenwiese:TRaum;
  Kaserne:TRaum;
  Schlafgemach:TRaum;
  Einsame_Herberge:TRaum;
  Graumoor:TRaum;
  Schattenweiden:TRaum;
  Westweg:TRaum;
  Bruecke:TRaum;
  Augvea:TRaum;
  Ostweg:TRaum;
  Oestliche_Huegel:TRaum;
  Verlassene_Burg:TRaum;
  Wachturm:TRaum;
  Kleiner_See:TRaum;
  Strasse_in_den_Sueden:TRaum;
  Tal:TRaum;
  Goblinstamm:TRaum;
  Karawane:TRaum;
  Am_schnellen_Bach:TRaum;
  Traenenwald:TRaum;
  Baerenhoehle:TRaum;
  Spitzdorf:TRaum;
  Der_grosse_Heuler:TRaum;
  Der_Sonnenstich:TRaum;
  //AnfangsVariablen für Setback nach Tod
  AnfangsRaum: TRaum;
  AnfangsHP:Integer;
  AnfangsRK:Integer;
  AnfangsAtk:Integer;
  MaxHP:Integer;
  //Gegner//
  Mieses_Essen: TEnemy;
  Goblin: TEnemy;
  Ork: TEnemy;
  Oger: TEnemy;
  aktuellerGegner: TEnemy;
  //Helm//
  Kappe:Tloot;
  Lederhelm:TLoot;
  Eisenhelm:TLoot;
  Gnorignums_Schaedelplatte:TLoot;
  //Rüstung//
  Gewand:Tloot;
  Kettenhemd:Tloot;
  Stahlruestung:Tloot;
  Granitebrows_Stachelpanzer:Tloot;
  //Stiefel//
  Alte_Latscher:Tloot;
  Lederschuhe:Tloot;
  Eisenstiefel:Tloot;
  Bodenmalmer:Tloot;
  //Waffen//
  Verroteter_Klumpen:TLoot;
  Eisenstreitkolben:Tloot;
  Orkischer_Hammerzahn:Tloot;
  Gigantischer_Knochenmuerber:Tloot;
  Muerbes_Holzschwert:Tloot;
  Eisenschwert:Tloot;
  Geschmuecktes_Silberschwert:Tloot;
  Drachenzahn:Tloot;
  //Spieler Items
  SpielerHelm:Tloot;
  SpielerRuestung:Tloot;
  SpielerSchuhe:Tloot;
  SpielerWaffe:Tloot;
  //Implementation
  Eingabe : String;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add ('Hallo, willkommen im Textadventure');
   Memo1.Lines.Add ('Du kannst dich mit dem Namen der Richung[Norden/Nord/N] bewegen');
      Memo1.Lines.Add ('Hilfe findest du mit ?');
         Memo1.Lines.Add ('Du kannst mit "camp" schlafen und HP regenrieren');
   //Typen sind Helm,Ruestung,Schuhe,Waffe
   //Helm-Loot//
   Kappe:=TLoot.create('Kappe','Helm','eine leichte Lederkappe','verschlissen',0,0,0);
   Lederhelm:=TLoot.create('Lederhelm','Helm','einen Lederhelm, der etwas Schutz bieten sollte,','normal',0,1,0);
   Eisenhelm:=TLoot.create('Eisenhelm','Helm','einen gut gebauten Eisenhelm','erlesen',0,3,0);
   Gnorignums_Schaedelplatte:=TLoot.create('gnorignums schädelplatte','Helm','gnorignums sagenhaften kopfschutz','magisch',5,5,0);
   //Rüstungs-Loot//
   Gewand:=TLoot.create('Gewand','Ruestung','ein einfaches Gewand','verschlissen',0,1,0);
   Kettenhemd:=TLoot.create('Kettenhemd','Ruestung','ein leichtes Kettenhemd','normal',0,3,0);
   Stahlruestung:=TLoot.create('Stahlrüstung','Ruestung','eine äußerst widerstandsfähgige Stahlrüstung','erlesen',2,5,0);
   Granitebrows_Stachelpanzer:=TLoot.create('Granitebrows Stachelpanzer','Ruestung','den legendären Stachelpanzer Granitebrows','magisch',5,10,1);
   //Stiefel-Loot//
   Alte_Latscher:=TLoot.create('Alte_Latscher','Schuhe','ein Paar abgewetzter und vielgetragene Schuhe','verschlissen',0,0,0);
   Lederschuhe:=TLoot.create('Lederschuhe','Schuhe','ein Paar guter Lederschuhe','normal',0,1,0);
   Eisenstiefel:=TLoot.create('Eisenstiefel','Schuhe','ein Paar dicker Eisenstiefel','magisch',0,3,0);
   Bodenmalmer:=TLoot.create('Bodenmalmer','Schuhe','die dir aus Geschichten bekannten Bodenmalmer','erlesen',5,5,0);
   //Waffen-Loot//
   Verroteter_Klumpen:=TLoot.create('Verroteter Klumpen','Waffe','einen modrigen Klumpen, den man zum Zuschlagen verwenden könnte,','verschlissen',0,1,4);
   Eisenstreitkolben:=TLoot.create('Eisenstreitkolben','Waffe','einen benutzten Eisenstreitkolben','normal',0,2,7);
   Orkischer_Hammerzahn:=TLoot.create('Orkischer Hammerzahn','Waffe','einen für Kriege verwendeten orkischen Hammerzahn','erlesen',0,3,11);
   Gigantischer_Knochenmuerber:=TLoot.create('Gigantischer Knochenmürber','Waffe','einen der mächtigsten Streitkolben, den Gigantischen Knochenmürber,','magisch',0,4,22);
   Muerbes_Holzschwert:=TLoot.create('Mürbes Holzschwert','Waffe','ein mürbes Holzschwert, welches vielleicht etwas besser als die Faust ist,','verschlissen',1,0,4);
   Eisenschwert:=TLoot.create('Eisenschwert','Waffe','ein stumpfes Eisenschwert','normal',2,0,7);
   Geschmuecktes_Silberschwert:=TLoot.create('Geschmücktes Silberschwert','Waffe','ein hochwertiges Silberschwert voller Verzierungen','erlesen',3,0,11);
   Drachenzahn:=TLoot.create('Drachenzahn','Waffe','einen mächtigen Drachenzahn','magisch',4,0,22);
   //Gegner//
   Mieses_Essen := TEnemy.create ('Mieses Essen', 'Entspricht der Norm... von der Schule', 5, 5, 1,'zerfetzt');
   Goblin := TEnemy.create ('Goblin', 'einem kleinen Wesen ,dass erstaunlich flink ist',3, 12, 1,'zerfetzt');
   Ork := TEnemy.create ('Ork', 'einem Krieger mit Blutunerlaufenen Augen', 10,10, 1,'zerfetzt');
   Oger := TEnemy.create ('Oger', 'Einem Abkömlinge der Riesen mit einer Keule', 15,6, 2,'Oger_Boss');

   //Räume//Hier am Besten nur lere Presetes erstellen und sie mit der Funktion RaumUpdate ändern
   //Räume müssen hier deklariert werden, aber zusätzlich in der RaumWechselProzedure eingetragen werden
   EmptyPreset					:=TRaum.create('An Empty Preset','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Spinnennest					:=TRaum.create('Spinnennest','An der gesamten Höhlenwand sind Kokons zu sehen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Spinnenkammer				:=TRaum.create('Spinnenkammer','In dieser Höhle wimmelt es von Spinnen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Waldlichtung					:=TRaum.create('Waldlichtung','Die Sonne auf dem Gesicht tut dir gut',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Hoehle						:=TRaum.create('Höhle','Ein modriger Geruch kommt von weiter Innen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Tautropfwald					:=TRaum.create('Tautropfwald','Überall hörst du Wasser von den Bäumen tropfen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Weggabelung					:=TRaum.create('Weggabelung','Der Weg gabelt sich hier nach West und Ost',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Hoehleneingang				:=TRaum.create('Höhleneingang','Beim Anblick dieser dunklen Höhle wird dir etwas mulmig',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Lagerhalle					:=TRaum.create('Lagerhalle','Hier gibt es viele Sachen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Feuerschlot					:=TRaum.create('Feuerschlot','Der heiße Gestank von Schwefel und Asche umgibt dich',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Abgrund_des_brennenden_Steins:=TRaum.create('Abgrund des brennenden Steins','Im inneren des Abgrunds fließt der brennende Stein',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Waldweg						:=TRaum.create('Waldweg','Du siehst den Wald und auf der anderen Seite Augvea',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Grosse_Blumenwiese			:=TRaum.create('Große Blumenwiese','Deine Nase wird von verschiedensten Gerüchen betört',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Kaserne						:=TRaum.create('Kaserne','Der Ruheort der Soldaten und Wächter - doch sie fehlen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Schlafgemach					:=TRaum.create('Schlafgemach','Der Besitzer der Burg besaß ein wirklich großes Bett',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Einsame_Herberge				:=TRaum.create('Einsame Herberge','Diese Herberge ist einsam, verlassen, verstaubt und dreckig',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Graumoor						:=TRaum.create('Graumoor','Dir fröstelt es etwas in diesem Morast',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Schattenweiden				:=TRaum.create('Schattenweiden','Die Schattenweiden des Graumoors scheinen überall hinzugreifen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Westweg						:=TRaum.create('Westweg','Auf diesem gut befestigten Weg kommst du gut voran',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Bruecke						:=TRaum.create('Brücke','Unter dir rauscht der Fluss',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Augvea						:=TRaum.create('Augvea','Das rege Treiben der Stadt zeugt von Zivilisation',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Ostweg						:=TRaum.create('Ostweg','Der Weg ist Umgeben von schönem Gelände',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Oestliche_Huegel				:=TRaum.create('Östliche Hügel','Die sanften Hügel machen das Vorankommen beschwerlicher',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Verlassene_Burg				:=TRaum.create('Verlassene Burg','Diese Burg ist mysteriöserweise verlassen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Wachturm						:=TRaum.create('Wachturm','Hier wacht keiner mehr',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Kleiner_See					:=TRaum.create('Kleiner See','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Strasse_in_den_Sueden		:=TRaum.create('Straße in den Süden','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Tal							:=TRaum.create('Tal','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Goblinstamm					:=TRaum.create('Goblinstamm','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Karawane						:=TRaum.create('Karawane','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Am_schnellen_Bach			:=TRaum.create('Am schnellen Bach','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Traenenwald					:=TRaum.create('Tränenwald','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Baerenhoehle					:=TRaum.create('Bärenhöhle','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Spitzdorf					:=TRaum.create('Spitzdorf','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Der_Grosse_Heuler			:=TRaum.create('Der Große Heuler','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Der_Sonnenstich				:=TRaum.create('Der Sonnenstich','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);

   //RaumUpdate//
   //Die Prozedure RaumUpdate() braucht 6 Pointer und zwar den Raum der zu
   //ändern ist die Räume die in den HimmelsRichtungen um ihn herum liegen
   //und immoment den Gegner im Raum
   RaumUpdate.RaumUpdate(Augvea,nil,Ostweg,Schlafgemach,Westweg);
   RaumUpdate.RaumUpdate(Schlafgemach,Augvea,nil,nil,nil);
   RaumUpdate.RaumUpdate(Ostweg,nil,Graumoor,nil,Augvea);
   RaumUpdate.RaumUpdate(Westweg,nil,Augvea,nil,nil);
   RaumUpdate.RaumUpdate(Graumoor,nil,nil,nil,Ostweg);
   //RaumUpdate Benötigt RaumPointer+AusgangsBeschreibungen
   RaumNamenUpdate(Augvea,'','Du tritts durch die Stadttore und siehst die Oststraße vor dir. In der ferne kannst du das Moor erkennen','Du tritts in die Herberge,hier kannst du die erholen','Du tritts durch die Stadttore und siehst den Weg der sich in die Berge schlängelt');
   RaumNamenUpdate(Schlafgemach,'Du verlässt die Herberge und stehst wieder auf dem Marktplatz','','','');
   RaumNamenUpdate(Ostweg,'','Deine Stiefel sinken im Morast ein und du hörst die Geräusche seltsamer Kreaturen um dich herum','','Du betritts die Stadt und findest dich auf dem Marktplatz wieder');
   RaumNamenUpdate(Westweg,'','Du betritts die Stadt und findest dich auf dem Marktplatz wieder','','');
   RaumNamenUpdate(Graumoor,'','','','Auf dem Weg aus dem Moor verfolgen dich die Albtraumhaften Bilder die du gesehen hast');
   //Zusätzliches Updates RaumPointer+Schwierigkeit+MD+MDA+MDS(ProzedureRaumwechsel und mTRAum)+Camp+CampPossible
   ZusaetzlicheUpdates(Augvea,'',0,0,0,false);
   ZusaetzlicheUpdates(Schlafgemach,'',0,0,0,true);
   ZusaetzlicheUpdates(Ostweg,'hard',100,5,50,false);       //Density von Hundert spawnt beim ersten Betreten
   ZusaetzlicheUpdates(Westweg,'hard',100,5,50,false);      //Immer ein Monster
   ZusaetzlicheUpdates(Graumoor,'SehrHard',100,2,10,false);
   //Startwerte//
   AnfangsRaum:= Augvea;
   aktuellerRaum := AnfangsRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;
   KampfProzedure.IstInKampf := False;
   //Spieler-Start-StatsNR2//
   AnfangsHP:=10;
   AnfangsRK:=10;
   AnfangsAtk:=3;
   //Spieler-start-stats//

   SpielerHP := AnfangsHP;
   SpielerRK := AnfangsRK;
   SpielerATK := AnfangsAtk;
   MaxHP:=AnfangsHP;
   SpielerHelm:=Kappe;
   SpielerRuestung:=Gewand;
   SpielerSchuhe:=Alte_Latscher;
   SpielerWaffe:=Verroteter_Klumpen;
   UIRefresh.UiRefresh();
end;

//--------------------------------Der Absolut------------------------------------//
//--------------------------------Heilige Button---------------------------------//

procedure TForm1.Button1Click(Sender: TObject);
begin
 Randomize;
 Eingabe := Edit1.text;

 //Befehlsauflistung: help //
 if (uppercase(Eingabe) = 'HELP') or (uppercase(Eingabe) = 'HILFE') or (uppercase(Eingabe) = 'BEFEHLE')  or (Eingabe='?') then
   begin
     Memo1.lines.add('');
     Memo1.lines.add('Help/Hilfe/Befehle: Befehlsauflistung');
     Memo1.lines.add('[Norden/Osten/Sueden/Westen]/[N/O/S/W]: In diese Richtung gehen');  //HIlfe Stellung
     Memo1.lines.add('Zurueck: In die vorherige Richtung gehen');
     Memo1.lines.add('Angreifen: Im Kampf einen Gegner attackieren');
     Memo1.lines.add('Fliehen: Im Kampf zum vorherigen Raum fliehen');
   end

 //Raumwechsel//

 else if (uppercase(Eingabe) = 'NORDEN') or (uppercase(Eingabe)='NORD') or (uppercase(Eingabe)='N')       //Anstatt den ganzen Code in jeder Eingabe zu haben wird nur noch eine Funktion "Raumwechsel" aufgerufen
 then
   begin
   RaumWechsel(AktuellerRaum.Norden);
 end

 else if (uppercase(Eingabe) = 'OSTEN') or (uppercase(Eingabe)='OST') or (uppercase(Eingabe)='O')
 then
 begin
     RaumWechsel(AktuellerRaum.Osten);
 end

 else if (uppercase(Eingabe) = 'SUEDEN') or (uppercase(Eingabe)='SUED') or (uppercase(Eingabe)='S')
 then
 begin
    RaumWechsel(AktuellerRaum.Sueden);
 end

 else if (uppercase(Eingabe) = 'WESTEN') or (uppercase(Eingabe)='WEST') or (uppercase(Eingabe)='W')
 then
 begin
    RaumWechsel(AktuellerRaum.Westen);
 end
 else if uppercase(Eingabe) = 'PICK'
 then
 begin
    LootDrop.Pickup();
 end
 //else if uppercase(Eingabe) = 'HUNT' then
 //begin
 //     RaumWechsel(aktuellerRaum)
 //end

 else if uppercase(Eingabe) = 'ZURUECK'
 then
 begin
   aktuellerRaum:=vorherigerRaum;
   IstInKampf:=false;
 end
 //Angreifen//

 else if (uppercase(Eingabe) = 'ANGREIFEN')
 then
 Kampf()
 else
 begin
 Memo1.lines.add('');
 Memo1.lines.add('Schreibe etwas in die Box um mit der Welt zu interagieren');
 Memo1.lines.add('Für Hilfe schreibe ?');
 end;
 //ELSE IF Schleife muss gefixt werden, sodaß bei unerkannter Eingabe die Hilfe angezeigt wird //
 //else
 //Memo1.lines.add('Unbekannte Eingabe');
 //Memo1.lines.add('Liste der Befehle mit : ?');//Hilfe Ausgabe bei unerkannter Eingabe

//RefresUI

UIRefresh.UiRefresh()
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Memo1.lines.add(SpielerHelm.Beschreibung)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Memo1.lines.add(SpielerRuestung.Beschreibung)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.lines.add(SpielerSchuhe.Beschreibung)
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.lines.add(SpielerWaffe.Beschreibung)
end;

end.

