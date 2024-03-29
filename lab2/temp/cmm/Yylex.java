// -*- Java -*- File generated by the BNF Converter (bnfc 2.9.3).
// Lexer definition for use with JLex
package cmm;
import java_cup.runtime.*;


public class Yylex implements java_cup.runtime.Scanner {
	private final int YY_BUFFER_SIZE = 512;
	private final int YY_F = -1;
	private final int YY_NO_STATE = -1;
	private final int YY_NOT_ACCEPT = 0;
	private final int YY_START = 1;
	private final int YY_END = 2;
	private final int YY_NO_ANCHOR = 4;
	private final int YY_BOL = 65536;
	private final int YY_EOF = 65537;

  String pstring = new String();
  final int unknown = -1;
  ComplexSymbolFactory.Location left = new ComplexSymbolFactory.Location(unknown, unknown);
  ComplexSymbolFactory cf = new ComplexSymbolFactory();
  public SymbolFactory getSymbolFactory() { return cf; }
  int yyline = unknown - 1;
  int yycolumn = unknown - 1;
  int yychar = unknown;
  public int line_num() { return (yyline+1); }
  public ComplexSymbolFactory.Location left_loc() {
    return left;
  }
  public ComplexSymbolFactory.Location right_loc() {
    ComplexSymbolFactory.Location left = left_loc();
  return left;
  }
  public String buff() {return new String(yy_buffer,yy_buffer_index,10).trim();}
	private java.io.BufferedReader yy_reader;
	private int yy_buffer_index;
	private int yy_buffer_read;
	private int yy_buffer_start;
	private int yy_buffer_end;
	private char yy_buffer[];
	private boolean yy_at_bol;
	private int yy_lexical_state;

	public Yylex (java.io.Reader reader) {
		this ();
		if (null == reader) {
			throw (new Error("Error: Bad input stream initializer."));
		}
		yy_reader = new java.io.BufferedReader(reader);
	}

	public Yylex (java.io.InputStream instream) {
		this ();
		if (null == instream) {
			throw (new Error("Error: Bad input stream initializer."));
		}
		yy_reader = new java.io.BufferedReader(new java.io.InputStreamReader(instream));
	}

	private Yylex () {
		yy_buffer = new char[YY_BUFFER_SIZE];
		yy_buffer_read = 0;
		yy_buffer_index = 0;
		yy_buffer_start = 0;
		yy_buffer_end = 0;
		yy_at_bol = true;
		yy_lexical_state = YYINITIAL;
	}

	private boolean yy_eof_done = false;
	private final int STRING = 5;
	private final int ESCAPED = 6;
	private final int YYINITIAL = 0;
	private final int COMMENT = 1;
	private final int CHAREND = 4;
	private final int CHARESC = 3;
	private final int CHAR = 2;
	private final int yy_state_dtrans[] = {
		0,
		55,
		57,
		57,
		57,
		57,
		57
	};
	private void yybegin (int state) {
		yy_lexical_state = state;
	}
	private int yy_advance ()
		throws java.io.IOException {
		int next_read;
		int i;
		int j;

		if (yy_buffer_index < yy_buffer_read) {
			return yy_buffer[yy_buffer_index++];
		}

		if (0 != yy_buffer_start) {
			i = yy_buffer_start;
			j = 0;
			while (i < yy_buffer_read) {
				yy_buffer[j] = yy_buffer[i];
				++i;
				++j;
			}
			yy_buffer_end = yy_buffer_end - yy_buffer_start;
			yy_buffer_start = 0;
			yy_buffer_read = j;
			yy_buffer_index = j;
			next_read = yy_reader.read(yy_buffer,
					yy_buffer_read,
					yy_buffer.length - yy_buffer_read);
			if (-1 == next_read) {
				return YY_EOF;
			}
			yy_buffer_read = yy_buffer_read + next_read;
		}

		while (yy_buffer_index >= yy_buffer_read) {
			if (yy_buffer_index >= yy_buffer.length) {
				yy_buffer = yy_double(yy_buffer);
			}
			next_read = yy_reader.read(yy_buffer,
					yy_buffer_read,
					yy_buffer.length - yy_buffer_read);
			if (-1 == next_read) {
				return YY_EOF;
			}
			yy_buffer_read = yy_buffer_read + next_read;
		}
		return yy_buffer[yy_buffer_index++];
	}
	private void yy_move_end () {
		if (yy_buffer_end > yy_buffer_start &&
		    '\n' == yy_buffer[yy_buffer_end-1])
			yy_buffer_end--;
		if (yy_buffer_end > yy_buffer_start &&
		    '\r' == yy_buffer[yy_buffer_end-1])
			yy_buffer_end--;
	}
	private boolean yy_last_was_cr=false;
	private void yy_mark_start () {
		yy_buffer_start = yy_buffer_index;
	}
	private void yy_mark_end () {
		yy_buffer_end = yy_buffer_index;
	}
	private void yy_to_mark () {
		yy_buffer_index = yy_buffer_end;
		yy_at_bol = (yy_buffer_end > yy_buffer_start) &&
		            ('\r' == yy_buffer[yy_buffer_end-1] ||
		             '\n' == yy_buffer[yy_buffer_end-1] ||
		             2028/*LS*/ == yy_buffer[yy_buffer_end-1] ||
		             2029/*PS*/ == yy_buffer[yy_buffer_end-1]);
	}
	private java.lang.String yytext () {
		return (new java.lang.String(yy_buffer,
			yy_buffer_start,
			yy_buffer_end - yy_buffer_start));
	}
	private int yylength () {
		return yy_buffer_end - yy_buffer_start;
	}
	private char[] yy_double (char buf[]) {
		int i;
		char newbuf[];
		newbuf = new char[2*buf.length];
		for (i = 0; i < buf.length; ++i) {
			newbuf[i] = buf[i];
		}
		return newbuf;
	}
	private final int YY_E_INTERNAL = 0;
	private final int YY_E_MATCH = 1;
	private java.lang.String yy_error_string[] = {
		"Error: Internal error.\n",
		"Error: Unmatched input.\n"
	};
	private void yy_error (int code,boolean fatal) {
		java.lang.System.out.print(yy_error_string[code]);
		java.lang.System.out.flush();
		if (fatal) {
			throw new Error("Fatal Error.\n");
		}
	}
	private int[][] unpackFromString(int size1, int size2, String st) {
		int colonIndex = -1;
		String lengthString;
		int sequenceLength = 0;
		int sequenceInteger = 0;

		int commaIndex;
		String workString;

		int res[][] = new int[size1][size2];
		for (int i= 0; i < size1; i++) {
			for (int j= 0; j < size2; j++) {
				if (sequenceLength != 0) {
					res[i][j] = sequenceInteger;
					sequenceLength--;
					continue;
				}
				commaIndex = st.indexOf(',');
				workString = (commaIndex==-1) ? st :
					st.substring(0, commaIndex);
				st = st.substring(commaIndex+1);
				colonIndex = workString.indexOf(':');
				if (colonIndex == -1) {
					res[i][j]=Integer.parseInt(workString);
					continue;
				}
				lengthString =
					workString.substring(colonIndex+1);
				sequenceLength=Integer.parseInt(lengthString);
				workString=workString.substring(0,colonIndex);
				sequenceInteger=Integer.parseInt(workString);
				res[i][j] = sequenceInteger;
				sequenceLength--;
			}
		}
		return res;
	}
	private int yy_acpt[] = {
		/* 0 */ YY_NOT_ACCEPT,
		/* 1 */ YY_NO_ANCHOR,
		/* 2 */ YY_NO_ANCHOR,
		/* 3 */ YY_NO_ANCHOR,
		/* 4 */ YY_NO_ANCHOR,
		/* 5 */ YY_NO_ANCHOR,
		/* 6 */ YY_NO_ANCHOR,
		/* 7 */ YY_NO_ANCHOR,
		/* 8 */ YY_NO_ANCHOR,
		/* 9 */ YY_NO_ANCHOR,
		/* 10 */ YY_NO_ANCHOR,
		/* 11 */ YY_NO_ANCHOR,
		/* 12 */ YY_NO_ANCHOR,
		/* 13 */ YY_NO_ANCHOR,
		/* 14 */ YY_NO_ANCHOR,
		/* 15 */ YY_NO_ANCHOR,
		/* 16 */ YY_NO_ANCHOR,
		/* 17 */ YY_NO_ANCHOR,
		/* 18 */ YY_NO_ANCHOR,
		/* 19 */ YY_NO_ANCHOR,
		/* 20 */ YY_NO_ANCHOR,
		/* 21 */ YY_NO_ANCHOR,
		/* 22 */ YY_NO_ANCHOR,
		/* 23 */ YY_NO_ANCHOR,
		/* 24 */ YY_NO_ANCHOR,
		/* 25 */ YY_NO_ANCHOR,
		/* 26 */ YY_NO_ANCHOR,
		/* 27 */ YY_NO_ANCHOR,
		/* 28 */ YY_NO_ANCHOR,
		/* 29 */ YY_NO_ANCHOR,
		/* 30 */ YY_NO_ANCHOR,
		/* 31 */ YY_NO_ANCHOR,
		/* 32 */ YY_NO_ANCHOR,
		/* 33 */ YY_NO_ANCHOR,
		/* 34 */ YY_NO_ANCHOR,
		/* 35 */ YY_NO_ANCHOR,
		/* 36 */ YY_NO_ANCHOR,
		/* 37 */ YY_NO_ANCHOR,
		/* 38 */ YY_NO_ANCHOR,
		/* 39 */ YY_NO_ANCHOR,
		/* 40 */ YY_NO_ANCHOR,
		/* 41 */ YY_NO_ANCHOR,
		/* 42 */ YY_NO_ANCHOR,
		/* 43 */ YY_NO_ANCHOR,
		/* 44 */ YY_NOT_ACCEPT,
		/* 45 */ YY_NO_ANCHOR,
		/* 46 */ YY_NO_ANCHOR,
		/* 47 */ YY_NO_ANCHOR,
		/* 48 */ YY_NO_ANCHOR,
		/* 49 */ YY_NOT_ACCEPT,
		/* 50 */ YY_NO_ANCHOR,
		/* 51 */ YY_NO_ANCHOR,
		/* 52 */ YY_NOT_ACCEPT,
		/* 53 */ YY_NO_ANCHOR,
		/* 54 */ YY_NO_ANCHOR,
		/* 55 */ YY_NOT_ACCEPT,
		/* 56 */ YY_NO_ANCHOR,
		/* 57 */ YY_NOT_ACCEPT,
		/* 58 */ YY_NO_ANCHOR,
		/* 59 */ YY_NO_ANCHOR,
		/* 60 */ YY_NO_ANCHOR,
		/* 61 */ YY_NO_ANCHOR,
		/* 62 */ YY_NO_ANCHOR,
		/* 63 */ YY_NO_ANCHOR,
		/* 64 */ YY_NO_ANCHOR,
		/* 65 */ YY_NO_ANCHOR,
		/* 66 */ YY_NO_ANCHOR,
		/* 67 */ YY_NO_ANCHOR,
		/* 68 */ YY_NO_ANCHOR,
		/* 69 */ YY_NO_ANCHOR,
		/* 70 */ YY_NO_ANCHOR,
		/* 71 */ YY_NO_ANCHOR,
		/* 72 */ YY_NO_ANCHOR,
		/* 73 */ YY_NO_ANCHOR,
		/* 74 */ YY_NO_ANCHOR,
		/* 75 */ YY_NO_ANCHOR,
		/* 76 */ YY_NO_ANCHOR,
		/* 77 */ YY_NO_ANCHOR,
		/* 78 */ YY_NO_ANCHOR,
		/* 79 */ YY_NO_ANCHOR,
		/* 80 */ YY_NO_ANCHOR,
		/* 81 */ YY_NO_ANCHOR,
		/* 82 */ YY_NO_ANCHOR,
		/* 83 */ YY_NO_ANCHOR,
		/* 84 */ YY_NO_ANCHOR,
		/* 85 */ YY_NO_ANCHOR,
		/* 86 */ YY_NO_ANCHOR
	};
	private int yy_cmap[] = unpackFromString(1,65538,
"35:9,42,36,35,42,34,35:18,42,16,35,33,35:2,8,35,1,2,12,10,5,11,41,13,40:10," +
"35,6,14,7,15,35:2,37:26,35:4,39,35,25,17,38,20,22,24,38,32,26,38:2,19,38,27" +
",18,38:2,29,23,28,21,30,31,38:3,3,9,4,35:66,37:23,35,37:7,38:24,35,38:8,35:" +
"65280,0:2")[0];

	private int yy_rmap[] = unpackFromString(1,87,
"0,1:7,2,3,4,5,1,6,7,8,9,10,1,11,1:6,12,1:3,13:2,14,13:8,1:3,15,16,17,18,19," +
"20,21,22,18,1,23,24,25,26,27,28,29,30,31,32,33,13,34,35,36,37,38,39,40,41,4" +
"2,43,44,45,46,13,47,48,49,50,51,52,53")[0];

	private int yy_nxt[][] = unpackFromString(54,43,
"1,2,3,4,5,6,7,8,9,45,10,11,12,13,14,15,50,16,79:2,80,79,81,79,82,79,46,79,8" +
"3,84,85,86,79,17,18,53,18,79:2,53,19,53,18,-1:50,20,-1:43,21,-1:44,23,-1:43" +
",24,-1:43,25,26,-1:36,27,-1:42,28,-1:52,79,64,79:14,-1:4,65,79,65:2,-1:3,17" +
":35,-1,17:6,-1:40,19,44,-1:2,26:35,-1,26:6,-1:17,79:16,-1:4,65,79,65:2,-1:2" +
"4,49,-1:17,32,-1:42,32,-1:11,22,-1:50,79:7,30,79:2,51,79:5,-1:4,65,79,65:2," +
"-1:42,47,-1:15,43,-1:40,52,-1:28,47,-1:9,29,-1:52,79:11,31,79:4,-1:4,65,79," +
"65:2,-1:19,79:2,33,79:13,-1:4,65,79,65:2,-1:2,1,41:11,48,41:21,-1,41,42,41:" +
"6,-1:17,79:5,34,79:10,-1:4,65,79,65:2,-1:2,1,53:33,-1,53,-1,53:6,-1:17,79:5" +
",35,79:10,-1:4,65,79,65:2,-1:19,79:3,36,79:12,-1:4,65,79,65:2,-1:19,79:5,37" +
",79:10,-1:4,65,79,65:2,-1:19,79:5,38,79:10,-1:4,65,79,65:2,-1:19,79:5,39,79" +
":10,-1:4,65,79,65:2,-1:19,79:10,40,79:5,-1:4,65,79,65:2,-1:19,79,54,79:14,-" +
"1:4,65,79,65:2,-1:19,79:4,73,79:11,-1:4,65,79,65:2,-1:19,79:6,56,79:9,-1:4," +
"65,79,65:2,-1:19,79:2,74,79:13,-1:4,65,79,65:2,-1:19,79:4,58,79:11,-1:4,65," +
"79,65:2,-1:19,79:11,75,79:4,-1:4,65,79,65:2,-1:19,79:9,59,79:6,-1:4,65,79,6" +
"5:2,-1:19,79:9,76,79:6,-1:4,65,79,65:2,-1:19,77,79:15,-1:4,65,79,65:2,-1:19" +
",79:6,60,79:9,-1:4,65,79,65:2,-1:19,79:4,78,79:11,-1:4,65,79,65:2,-1:19,79:" +
"2,61,79:13,-1:4,65,79,65:2,-1:19,79:2,62,79:13,-1:4,65,79,65:2,-1:19,79:12," +
"63,79:3,-1:4,65,79,65:2,-1:19,79,66,79:14,-1:4,65,79,65:2,-1:19,79:2,67,79:" +
"13,-1:4,65,79,65:2,-1:19,79:8,68,79:7,-1:4,65,79,65:2,-1:19,79:12,69,79:3,-" +
"1:4,65,79,65:2,-1:19,79:5,70,79:10,-1:4,65,79,65:2,-1:19,79,71,79:14,-1:4,6" +
"5,79,65:2,-1:19,79:15,72,-1:4,65,79,65:2,-1:2");

	public java_cup.runtime.Symbol next_token ()
		throws java.io.IOException {
		int yy_lookahead;
		int yy_anchor = YY_NO_ANCHOR;
		int yy_state = yy_state_dtrans[yy_lexical_state];
		int yy_next_state = YY_NO_STATE;
		int yy_last_accept_state = YY_NO_STATE;
		boolean yy_initial = true;
		int yy_this_accept;

		yy_mark_start();
		yy_this_accept = yy_acpt[yy_state];
		if (YY_NOT_ACCEPT != yy_this_accept) {
			yy_last_accept_state = yy_state;
			yy_mark_end();
		}
		while (true) {
			if (yy_initial && yy_at_bol) yy_lookahead = YY_BOL;
			else yy_lookahead = yy_advance();
			yy_next_state = YY_F;
			yy_next_state = yy_nxt[yy_rmap[yy_state]][yy_cmap[yy_lookahead]];
			if (YY_EOF == yy_lookahead && true == yy_initial) {

  return cf.newSymbol("EOF", sym.EOF, left_loc(), left_loc());
			}
			if (YY_F != yy_next_state) {
				yy_state = yy_next_state;
				yy_initial = false;
				yy_this_accept = yy_acpt[yy_state];
				if (YY_NOT_ACCEPT != yy_this_accept) {
					yy_last_accept_state = yy_state;
					yy_mark_end();
				}
			}
			else {
				if (YY_NO_STATE == yy_last_accept_state) {
					throw (new Error("Lexical Error: Unmatched Input."));
				}
				else {
					yy_anchor = yy_acpt[yy_last_accept_state];
					if (0 != (YY_END & yy_anchor)) {
						yy_move_end();
					}
					yy_to_mark();
					switch (yy_last_accept_state) {
					case 1:
						
					case -2:
						break;
					case 2:
						{ return cf.newSymbol("", sym._SYMB_0, left_loc(), right_loc()); }
					case -3:
						break;
					case 3:
						{ return cf.newSymbol("", sym._SYMB_1, left_loc(), right_loc()); }
					case -4:
						break;
					case 4:
						{ return cf.newSymbol("", sym._SYMB_2, left_loc(), right_loc()); }
					case -5:
						break;
					case 5:
						{ return cf.newSymbol("", sym._SYMB_3, left_loc(), right_loc()); }
					case -6:
						break;
					case 6:
						{ return cf.newSymbol("", sym._SYMB_4, left_loc(), right_loc()); }
					case -7:
						break;
					case 7:
						{ return cf.newSymbol("", sym._SYMB_5, left_loc(), right_loc()); }
					case -8:
						break;
					case 8:
						{ return cf.newSymbol("", sym._SYMB_6, left_loc(), right_loc()); }
					case -9:
						break;
					case 9:
						{ throw new Error("Illegal Character <"+yytext()+">"); }
					case -10:
						break;
					case 10:
						{ return cf.newSymbol("", sym._SYMB_13, left_loc(), right_loc()); }
					case -11:
						break;
					case 11:
						{ return cf.newSymbol("", sym._SYMB_14, left_loc(), right_loc()); }
					case -12:
						break;
					case 12:
						{ return cf.newSymbol("", sym._SYMB_11, left_loc(), right_loc()); }
					case -13:
						break;
					case 13:
						{ return cf.newSymbol("", sym._SYMB_12, left_loc(), right_loc()); }
					case -14:
						break;
					case 14:
						{ return cf.newSymbol("", sym._SYMB_15, left_loc(), right_loc()); }
					case -15:
						break;
					case 15:
						{ return cf.newSymbol("", sym._SYMB_16, left_loc(), right_loc()); }
					case -16:
						break;
					case 16:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -17:
						break;
					case 17:
						{ /* skip */ }
					case -18:
						break;
					case 18:
						{ /* ignore white space. */ }
					case -19:
						break;
					case 19:
						{ return cf.newSymbol("", sym._INTEGER_, left_loc(), right_loc(), new Integer(yytext())); }
					case -20:
						break;
					case 20:
						{ return cf.newSymbol("", sym._SYMB_19, left_loc(), right_loc()); }
					case -21:
						break;
					case 21:
						{ return cf.newSymbol("", sym._SYMB_7, left_loc(), right_loc()); }
					case -22:
						break;
					case 22:
						{ return cf.newSymbol("", sym._SYMB_8, left_loc(), right_loc()); }
					case -23:
						break;
					case 23:
						{ return cf.newSymbol("", sym._SYMB_9, left_loc(), right_loc()); }
					case -24:
						break;
					case 24:
						{ return cf.newSymbol("", sym._SYMB_10, left_loc(), right_loc()); }
					case -25:
						break;
					case 25:
						{ yybegin(COMMENT); }
					case -26:
						break;
					case 26:
						{ /* skip */ }
					case -27:
						break;
					case 27:
						{ return cf.newSymbol("", sym._SYMB_17, left_loc(), right_loc()); }
					case -28:
						break;
					case 28:
						{ return cf.newSymbol("", sym._SYMB_18, left_loc(), right_loc()); }
					case -29:
						break;
					case 29:
						{ return cf.newSymbol("", sym._SYMB_20, left_loc(), right_loc()); }
					case -30:
						break;
					case 30:
						{ return cf.newSymbol("", sym._SYMB_25, left_loc(), right_loc()); }
					case -31:
						break;
					case 31:
						{ return cf.newSymbol("", sym._SYMB_26, left_loc(), right_loc()); }
					case -32:
						break;
					case 32:
						{ return cf.newSymbol("", sym._DOUBLE_, left_loc(), right_loc(), new Double(yytext())); }
					case -33:
						break;
					case 33:
						{ return cf.newSymbol("", sym._SYMB_21, left_loc(), right_loc()); }
					case -34:
						break;
					case 34:
						{ return cf.newSymbol("", sym._SYMB_23, left_loc(), right_loc()); }
					case -35:
						break;
					case 35:
						{ return cf.newSymbol("", sym._SYMB_28, left_loc(), right_loc()); }
					case -36:
						break;
					case 36:
						{ return cf.newSymbol("", sym._SYMB_29, left_loc(), right_loc()); }
					case -37:
						break;
					case 37:
						{ return cf.newSymbol("", sym._SYMB_24, left_loc(), right_loc()); }
					case -38:
						break;
					case 38:
						{ return cf.newSymbol("", sym._SYMB_30, left_loc(), right_loc()); }
					case -39:
						break;
					case 39:
						{ return cf.newSymbol("", sym._SYMB_22, left_loc(), right_loc()); }
					case -40:
						break;
					case 40:
						{ return cf.newSymbol("", sym._SYMB_27, left_loc(), right_loc()); }
					case -41:
						break;
					case 41:
						{ /* skip */ }
					case -42:
						break;
					case 42:
						{ /* skip */ }
					case -43:
						break;
					case 43:
						{ yybegin(YYINITIAL); }
					case -44:
						break;
					case 45:
						{ throw new Error("Illegal Character <"+yytext()+">"); }
					case -45:
						break;
					case 46:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -46:
						break;
					case 47:
						{ return cf.newSymbol("", sym._DOUBLE_, left_loc(), right_loc(), new Double(yytext())); }
					case -47:
						break;
					case 48:
						{ /* skip */ }
					case -48:
						break;
					case 50:
						{ throw new Error("Illegal Character <"+yytext()+">"); }
					case -49:
						break;
					case 51:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -50:
						break;
					case 53:
						{ throw new Error("Illegal Character <"+yytext()+">"); }
					case -51:
						break;
					case 54:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -52:
						break;
					case 56:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -53:
						break;
					case 58:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -54:
						break;
					case 59:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -55:
						break;
					case 60:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -56:
						break;
					case 61:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -57:
						break;
					case 62:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -58:
						break;
					case 63:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -59:
						break;
					case 64:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -60:
						break;
					case 65:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -61:
						break;
					case 66:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -62:
						break;
					case 67:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -63:
						break;
					case 68:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -64:
						break;
					case 69:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -65:
						break;
					case 70:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -66:
						break;
					case 71:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -67:
						break;
					case 72:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -68:
						break;
					case 73:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -69:
						break;
					case 74:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -70:
						break;
					case 75:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -71:
						break;
					case 76:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -72:
						break;
					case 77:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -73:
						break;
					case 78:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -74:
						break;
					case 79:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -75:
						break;
					case 80:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -76:
						break;
					case 81:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -77:
						break;
					case 82:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -78:
						break;
					case 83:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -79:
						break;
					case 84:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -80:
						break;
					case 85:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -81:
						break;
					case 86:
						{ return cf.newSymbol("", sym.Id, left_loc(), right_loc(), yytext().intern()); }
					case -82:
						break;
					default:
						yy_error(YY_E_INTERNAL,false);
					case -1:
					}
					yy_initial = true;
					yy_state = yy_state_dtrans[yy_lexical_state];
					yy_next_state = YY_NO_STATE;
					yy_last_accept_state = YY_NO_STATE;
					yy_mark_start();
					yy_this_accept = yy_acpt[yy_state];
					if (YY_NOT_ACCEPT != yy_this_accept) {
						yy_last_accept_state = yy_state;
						yy_mark_end();
					}
				}
			}
		}
	}
}
