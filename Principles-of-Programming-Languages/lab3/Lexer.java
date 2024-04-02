
import java.util.ArrayList;
import java.util.List;

enum TokenType {
    NUM, STR, ASSIGN, OPERATION, KEYWORD, ID, SEMICOLON
}

public class Lexer {

    static int counter = 0;
    private static int cur_index = 0;
    static String typ, tok, consumed;
    static String[] result;
    static List<Token<String, String>> tokens = new ArrayList<>();
    static String cur_line;
    static Token<String, String> cur_token;

    public static String[] lexNum(String line) {
        String num = "";
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (!Character.isDigit(c)) {
                break;
            }
            num += c;
        }
        return new String[] { "NUM", num, String.valueOf(num.length()) };
    }

    public static String[] lexStr(String line) {
        char delimiter = line.charAt(0);
        String string = "";
        line = line.substring(1);
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (c == delimiter) {
                break;
            }
            string += c;
        }
        return new String[] { "STR", string, String.valueOf(string.length()) };
    }

    public static String[] lexId(String line) {
        List<String> keywords = List.of("print", "int", "float", "string", "while", "if", "elif", "else");
        String id = "";
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (!Character.isDigit(c) && !Character.isAlphabetic(c) || c == ' ' || c == '=') {
                break;
            }
            id += c;
        }
        if (keywords.contains(id)) {
            return new String[] { "KEYWORD", id, String.valueOf(id.length()) };
        }
        return new String[] { "ID", id, String.valueOf(id.length()) };
    }

    public static Token<String, String> lex(String line) {
        while (counter < line.length()) {
            char ch = line.charAt(counter);
            if (Character.isDigit(ch)) {
                result = lexNum(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.parseInt(consumed);
                return new Token<>(typ, tok);
            } else if (ch == '"' || ch == '\'') {
                result = lexStr(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.parseInt(consumed) + 2;
                return new Token<>(typ, tok);
            } else if (ch == '=') {
                typ = "ASSIGN";
                tok = "=";
                counter++;
                return new Token<>(typ, tok);
            } else if (ch == '+') {
                typ = "OPERATION";
                tok = "+";
                counter++;
                return new Token<>(typ, tok);
            } else if (ch == '-') {
                typ = "OPERATION";
                tok = "-";
                counter++;
                return new Token<>(typ, tok);
            } else if (ch == '*') {
                typ = "OPERATION";
                tok = "*";
                counter++;
                return new Token<>(typ, tok);
            } else if (ch == '/') {
                typ = "OPERATION";
                tok = "/";
                counter++;
                return new Token<>(typ, tok);
            } else if (Character.isAlphabetic(ch)) {
                result = lexId(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.parseInt(consumed);
                return new Token<>(typ, tok);
            } else if (ch == ';') {
                typ = "SEMICOLON";
                tok = ";";
                counter++;
                return new Token<>(typ, tok);
            } else {
                counter++;
            }
        }
        return null;
    }

    public static Token<String, String> get_next_token() {
        if (tokens == null || cur_index >= tokens.size()) {
            Token<String, String> nextToken = lex(cur_line);
            if (nextToken == null) {
                return null;
            } else {
                tokens.add(nextToken);
            }
        }
        return tokens.get(cur_index++);
    }

    public static Token<String, String> match(String check_tok_typ) {
        if (cur_token.type.equals(check_tok_typ)) {
            Token<String, String> prev_tok = cur_token;
            cur_token = get_next_token();
            return prev_tok;
        } else {
            System.out.println("Bad token");
            throw new RuntimeException("Bad token");
        }
    }

    public static void main(String[] args) {
        cur_line = "int y;";
        cur_token = get_next_token();
        Token<String, String> key1 = match("KEYWORD");
        Token<String, String> id1 = match("ID");
        match("SEMICOLON");
        System.out.println("Declaration detected");
        Variable v = new Variable(key1, id1);
        System.out.println(v.toString());
    }
}
