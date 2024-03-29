// File generated by the BNF Converter (bnfc 2.9.3).

package arithm;

public class PrettyPrinter
{
  //For certain applications increasing the initial size of the buffer may improve performance.
  private static final int INITIAL_BUFFER_SIZE = 128;
  private static final int INDENT_WIDTH = 2;
  //You may wish to change the parentheses used in precedence.
  private static final String _L_PAREN = new String("(");
  private static final String _R_PAREN = new String(")");
  //You may wish to change render
  private static void render(String s)
  {
    if (s.equals("{"))
    {
       onEmptyLine();
       buf_.append(s);
       _n_ = _n_ + INDENT_WIDTH;
       buf_.append("\n");
       indent();
    }
    else if (s.equals("(") || s.equals("["))
       buf_.append(s);
    else if (s.equals(")") || s.equals("]"))
    {
       removeTrailingWhitespace();
       buf_.append(s);
       buf_.append(" ");
    }
    else if (s.equals("}"))
    {
       _n_ = _n_ - INDENT_WIDTH;
       onEmptyLine();
       buf_.append(s);
       buf_.append("\n");
       indent();
    }
    else if (s.equals(","))
    {
       removeTrailingWhitespace();
       buf_.append(s);
       buf_.append(" ");
    }
    else if (s.equals(";"))
    {
       removeTrailingWhitespace();
       buf_.append(s);
       buf_.append("\n");
       indent();
    }
    else if (s.equals("")) return;
    else if (s.trim().equals(""))
    {
       backup();
       buf_.append(s);
    }
    else
    {
       buf_.append(s);
       buf_.append(" ");
    }
  }


  //  print and show methods are defined for each category.
  public static String print(arithm.Absyn.Exp foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(arithm.Absyn.Exp foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  /***   You shouldn't need to change anything beyond this point.   ***/

  private static void pp(arithm.Absyn.Exp foo, int _i_)
  {
    if (foo instanceof arithm.Absyn.EAdd)
    {
       arithm.Absyn.EAdd _eadd = (arithm.Absyn.EAdd) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_eadd.exp_1, 0);
       render("+");
       pp(_eadd.exp_2, 1);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof arithm.Absyn.EMul)
    {
       arithm.Absyn.EMul _emul = (arithm.Absyn.EMul) foo;
       if (_i_ > 1) render(_L_PAREN);
       pp(_emul.exp_1, 1);
       render("*");
       pp(_emul.exp_2, 2);
       if (_i_ > 1) render(_R_PAREN);
    }
    else     if (foo instanceof arithm.Absyn.EInt)
    {
       arithm.Absyn.EInt _eint = (arithm.Absyn.EInt) foo;
       if (_i_ > 2) render(_L_PAREN);
       pp(_eint.integer_, 0);
       if (_i_ > 2) render(_R_PAREN);
    }

  }


  private static void sh(arithm.Absyn.Exp foo)
  {
    if (foo instanceof arithm.Absyn.EAdd)
    {
       arithm.Absyn.EAdd _eadd = (arithm.Absyn.EAdd) foo;
       render("(");
       render("EAdd");
       sh(_eadd.exp_1);
       sh(_eadd.exp_2);
       render(")");
    }
    if (foo instanceof arithm.Absyn.EMul)
    {
       arithm.Absyn.EMul _emul = (arithm.Absyn.EMul) foo;
       render("(");
       render("EMul");
       sh(_emul.exp_1);
       sh(_emul.exp_2);
       render(")");
    }
    if (foo instanceof arithm.Absyn.EInt)
    {
       arithm.Absyn.EInt _eint = (arithm.Absyn.EInt) foo;
       render("(");
       render("EInt");
       sh(_eint.integer_);
       render(")");
    }
  }


  private static void pp(Integer n, int _i_) { buf_.append(n); buf_.append(" "); }
  private static void pp(Double d, int _i_) { buf_.append(String.format(java.util.Locale.ROOT, "%.15g ", d)); }
  private static void pp(String s, int _i_) { buf_.append(s); buf_.append(" "); }
  private static void pp(Character c, int _i_) { buf_.append("'" + c.toString() + "'"); buf_.append(" "); }
  private static void sh(Integer n) { render(n.toString()); }
  private static void sh(Double d) { render(String.format(java.util.Locale.ROOT, "%.15g", d)); }
  private static void sh(Character c) { render("'" + c.toString() + "'"); }
  private static void sh(String s) { printQuoted(s); }

  private static void printQuoted(String s) { render("\"" + s + "\""); }

  private static void indent()
  {
    int n = _n_;
    while (n > 0)
    {
      buf_.append(' ');
      n--;
    }
  }

  private static void backup()
  {
    int prev = buf_.length() - 1;
    if (prev >= 0 && buf_.charAt(prev) == ' ')
      buf_.setLength(prev);
  }

  private static void trim()
  {
    // Trim initial spaces
    int end = 0;
    int len = buf_.length();
    while (end < len && buf_.charAt(end) == ' ')
      end++;
    buf_.delete(0, end);
    // Trim trailing spaces
    removeTrailingSpaces();
  }

  private static void removeTrailingSpaces()
  {
    int end = buf_.length();
    while (end > 0 && buf_.charAt(end-1) == ' ')
      end--;
    buf_.setLength(end);
  }

  private static void removeTrailingWhitespace()
  {
    int end = buf_.length();
    while (end > 0 && (buf_.charAt(end-1) == ' ' || buf_.charAt(end-1) == '\n'))
      end--;
    buf_.setLength(end);
  }

  private static void onEmptyLine()
  {
    removeTrailingSpaces();
    int len = buf_.length();
    if (len > 0 && buf_.charAt(len-1) != '\n') buf_.append("\n");
    indent();
  }

  private static int _n_ = 0;
  private static StringBuilder buf_ = new StringBuilder(INITIAL_BUFFER_SIZE);
}

