package arbolast;
import java_cup.runtime.Symbol;
import java_cup.runtime.ComplexSymbolFactory;
import java_cup.runtime.ComplexSymbolFactory.Location;

%%

%public
%class AnalisisLexico
%cupsym Simbolo
%cup
%unicode
%line
%column

digito  =   [0-9]
entero  =   {digito}+
letra   =   [a-zA-Z]
id      =   ({letra} | "_") ({letra} | "_" | {digito})*
espacio =   (" " | \r | \n | \t | \f)+

%{
  ComplexSymbolFactory symbolFactory;
  
  public void setSymbolFactory(ComplexSymbolFactory sf){
      symbolFactory = sf;
  }

  private Symbol symbol(String name, int sym) {
      return symbolFactory.newSymbol(name, sym, new Location(yyline+1,yycolumn+1,yychar), new Location(yyline+1,yycolumn+yylength(),yychar+yylength()));
  }

  private Symbol symbol(String name, int sym, Object val) {
      Location left = new Location(yyline+1,yycolumn+1,yychar);
      Location right= new Location(yyline+1,yycolumn+yylength(), yychar+yylength());
      return symbolFactory.newSymbol(name, sym, left, right,val);
  }
  private Symbol symbol(String name, int sym, Object val,int buflength) {
      Location left = new Location(yyline+1,yycolumn+yylength()-buflength,yychar+yylength()-buflength);
      Location right= new Location(yyline+1,yycolumn+yylength(), yychar+yylength());
      return symbolFactory.newSymbol(name, sym, left, right,val);
  }
  private void error(String message) {
    System.out.println("Error en linea "+(yyline+1)+", columna "+(yycolumn+1)+" caracter: "+message);
  }


%}

%eofval{
     return symbolFactory.newSymbol("EOF", Simbolo.EOF, new Location(yyline+1,yycolumn+1,yychar), new Location(yyline+1,yycolumn+1,yychar+1));
%eofval}


%%

<YYINITIAL>{
    "("     {   return symbol("PARENTESIS_ABIERTO",Simbolo.PARENTESIS_ABIERTO);    }

    ")"     {   return symbol("PARENTESIS_CERRADO",Simbolo.PARENTESIS_CERRADO);    }

    "{"     { return symbol("LLAVE_ABIERTA", Simbolo.LLAVE_ABIERTA); }

    "}"     { return symbol("LLAVE_CERRADA", Simbolo.LLAVE_CERRADA); }

    ":"     { return symbol("DOS_PUNTOS", Simbolo.DOS_PUNTOS); }

    ","     {   return symbol("COMA",Simbolo.COMA);                  }

    "for"    { return symbol("FOR", Simbolo.FOR); }

    "do"     { return symbol("DO", Simbolo.DO); }

    "switch" { return symbol("SWITCH", Simbolo.SWITCH); }

    "case"   { return symbol("CASE", Simbolo.CASE); }

    "default" { return symbol("DEFAULT", Simbolo.DEFAULT); }
    
    "if"    {   return symbol("IF",Simbolo.IF);                    }

    "else"  {   return symbol("ELSE",Simbolo.ELSE);                  }

    "end"   {   return symbol("END",Simbolo.END);                   }

    "while" {   return symbol("WHILE",Simbolo.WHILE);                 }

    "concat"    {   return symbol("CONCAT",Simbolo.CONCAT);                }

    "puts"  {   return symbol("PUTS",Simbolo.PUTS);                  }

    "or"    {   return symbol("OR",Simbolo.OR);                    }

    "and"   {   return symbol("AND",Simbolo.AND);                   }

    "not"   {   return symbol("NOT",Simbolo.NOT);                  }

    "=="    {   return symbol("IGUAL_IGUAL",Simbolo.IGUAL_IGUAL);           }

    "<"     {   return symbol("MENOR",Simbolo.MENOR);                 }

    ">"     {   return symbol("MAYOR",Simbolo.MAYOR);                 }

    "="     {   return symbol("IGUAL",Simbolo.IGUAL);                 }

    "+"     {   return symbol("MAS",Simbolo.MAS);                   }

    "*"     {   return symbol("ASTERISCO",Simbolo.ASTERISCO);             }

    {entero}    {   return symbol("ENTERO",Simbolo.ENTERO, yytext());      }

    [\"] ~[\"]  {
                String t = yytext();
                return symbol("CADENA",Simbolo.CADENA, t.substring(1, t.length() - 1));
                }

    {id}    {   return symbol("ID",Simbolo.ID, yytext());          }

    {espacio}   { }

    "/*" ~"*/"  { }

    .   {   error(yytext());      }

}