UNIT mTRaum;

interface

//--------------------  ggf Uses-Liste einf�gen !  --------------------
//uses ....;
uses
  mTEnemy;

type
  TRaum = class

  public //Attribute
    Raumname : String;
    Beschreibung : String;
    Norden : TRaum;
    Osten : TRaum;
    Sueden : TRaum;
    Westen : TRaum;
    Enemy : TEnemy;
    NORDENLeave:String;
    OSTENLeave:String;
    SUEDENLeave:String;
    WESTENLeave:String;
  public //Methoden
    constructor create (RaumN : String; Beschr: String; N: TRaum; O: TRaum; S: TRaum; W: TRaum; Gegner: TEnemy;
    NordLeave:String; EastLeave:String; SuedLeave:String; WestLeave:String);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition 
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TRaum.create (RaumN : String; Beschr: String; N: TRaum; O: TRaum; S: TRaum; W: TRaum; Gegner: TEnemy;
                         NordLeave:String; EastLeave:String; SuedLeave:String; WestLeave:String);
begin
  inherited create;
  Raumname := RaumN;
  Beschreibung := Beschr;
  Norden := N;
  Osten := O;
  Sueden := S;
  Westen := W;
  Enemy := Gegner;
  NORDENLeave:=NordLeave;
  OSTENLeave:=EastLeave;
  SUEDENLeave:=SuedLeave;
  WESTENLeave:=Westleave;
end;

end.
