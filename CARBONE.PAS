{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2025
  @website(https://www.gladir.com/ecologix)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Program CARBONE;

Var
 Distance:Real;
 Transport:Integer;
 Co2:Real;
 Err:Word;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('CARBONE : Cette commande permet de calculer l''empreinte ',
                    'carbone.');
  WriteLn;
  WriteLn('Syntaxe : CARBONE mode distance');
  WriteLn;
  WriteLn(' mode     Ce parametre permet d''indiquer le mode de transport :');
  WriteLn('           1  Voiture');
  WriteLn('           2  Autobus');
  WriteLn('           3  V‚lo');
  WriteLn('           4  Avion');
  WriteLn(' distance Ce parametre permet d''indiquer la distance en km');
 End
  Else
 Begin
  If(ParamStr(1)<>'')and(ParamStr(2)<>'')Then Begin
   Val(ParamStr(1),Transport,Err);
   Val(ParamStr(2),Distance,Err);
  End
   Else
  Begin
   Writeln('--- Calcul de l''empreinte carbone ---');
   Writeln('Entrez la distance parcourue en km : ');
   ReadLn(Distance);
   Writeln('Choisissez le mode de transport :');
   Writeln('1. Voiture');
   Writeln('2. Autobus');
   Writeln('3. V‚lo');
   Writeln('4. Avion');
   ReadLn(Transport);
  End;
  Case Transport of
   1: co2:=distance * 0.192;  { kg CO2/km pour voiture moyenne }
   2: co2:=distance * 0.105;  { kg CO2/km pour bus }
   3: co2:=0;                  { v‚lo = z‚ro ‚mission }
   4: co2:=distance * 0.285;  { kg CO2/km pour avion }
   Else co2 := 0;
  End;
  WriteLn('Votre trajet a g‚n‚r‚ environ ', co2:0:2, ' kg de CO2.');
 End;
END.