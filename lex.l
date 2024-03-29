%{
#include "y.tab.h"
%}

DIGIT [0-9]
ALPHA [a-z]
ALPHA_CAPITAL [A-Z]
ALNUM [0-9a-zA-Z]

%%

"if"      	return(IF);
"else"    	return(ELSE);
"while"		return(WHILE);
"for"     	return(FOR);
"switch"  	return(SWITCH);
"case"    	return(CASE);
"default" 	return(DEFAULT);
"do"		return(DO);
"break" 	return(BREAK);

[*+-/=%;~&|^(){}:]  {return yytext[0];}

"&&"		return (AND);
"||"		return(OR);
"!"			return(NOT);
"=="		return(EQ);
"!="		return(NOTEQ);
">="		return(GTE);
"<="		return(LTE);
">"			return(GT);
"<"			return(LT);
"++"		return(INC);
"--"		return(DEC);


"int"			return TYPE_INT;
"char"			return TYPE_CHR;
"double"		return TYPE_DBL;
"string"  		return TYPE_STR;
"const"   		return TYPE_CONST;
"program"		return PROGRAM;
"exit"			return exit_command;
"symbol_table" 	return show_symbol_table;

[ \t\n]+        ;       /* ignore whitespace */

\-?{DIGIT}*"."{DIGIT}+      { yylval.DBL   = atof(yytext); return DOUBLE_NUM;}
\-?{DIGIT}+				 	{ yylval.INTGR = atoi(yytext); return NUM;}
\'.\'						{ yylval.INTGR = yytext[1]-'a'; return(CHAR_VALUE); }
{ALPHA}						{ yylval.INTGR = *yytext-'a'; 	return(ID); }

\"[0-9a-zA-Z ]+\" 			{ yylval.STRNG = yytext; return(STRING_VALUE); }

"//".*                		;
"/*"(.|\n)*"*/"     		;

%%