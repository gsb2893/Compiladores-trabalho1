/* 
* A primeira se��o da especifica��o vai at� o primeiro %%,
* e consiste de c�digo Java que � copiado ao p� da letra
*
*/

package minijava;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

%%

/*
* A segunda se��o vai at� o pr�ximo %%, e s�o diversos par�metros
* de configura��o, al�m de c�digo Java copiado para o corpo da
* classe do analisador l�xico
*
*/

%class Scanner          // nome da classe do analisador
%public                 // classe deve ser p�blica
%line                   // guarde n�mero da linha em yyline
%column                 // guarde n�mero da coluna em yycolumn
%function nextToken     // nome do m�todo que vai fornecer um token
%type Token             // classe usada para tokens

// C�digo Java entre %{ e %} � copiado pro corpo da classe
// do analisador
%{ 

	public Scanner() { }

	public void input(String input) {
	    // inicializa entrada pro analisador
		yyreset(new StringReader(input));
	}
	
	public List<Token> tokens() throws IOException {
		List<Token> tokens = new ArrayList<Token>();
		Token tok = nextToken();
		while(tok.tipo != Token.EOF) {
			tokens.add(tok);
			tok = nextToken();
		}
		tokens.add(tok);
		return tokens;
	}

%}

%%

/*
* A �ltima se��o cont�m as regras l�xicas, cada regra � um
* par com uma express�o regular e um trecho de c�digo Java
* entre { e }.
*
*/

// Espa�os s�o ignorados
[ \r\n\t\f]    { }

// Exemplo de regra
"boolean"      { return new Token(Token.BOOLEAN, yyline, yycolumn); }

// Identificadores e numerais devem ser retornados com
// return new Token(Token.ID, yytext(), yyline, yycolumn)
// e return new Token(Token.NUM, yytext(), yyline, yycolumn)

// Regra para EOF
<<EOF>>      { return new Token(Token.EOF, yyline, yycolumn); }

// Tokens de um caractere
.            { return new Token((int)(yytext().charAt(0)), yyline, yycolumn); }

