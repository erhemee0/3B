
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Pair<A, B> {
    public final A type;
    public final B token;

    public Pair(A type, B token) {
        this.type = type;
        this.token = token;
    }
}

public class lab2 {
    public static String[] lex_num(String line) {
        String num = "";
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (!Character.isDigit(c)) {
                break;
            }
            num = num + c;
        }
        return new String[] { "num", num, String.valueOf(num.length()) };
    }

    public static String[] lex_str(String line) {
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
        return new String[] { "str", string, String.valueOf(string.length()) };
    }

    public static String[] lex_id(String line) {
        List<String> keywords = new ArrayList<>(List.of("print", "int", "while", "if", "elif", "else"));
        String id = "";
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (!Character.isDigit(c) && !Character.isAlphabetic(i) || c == ' ' || c == '=') {
                break;
            }
            id += c;
        }
        if (keywords.contains(id)) {
            return new String[] { "keyword", id, String.valueOf(id.length()) };

        }
        return new String[] { "ID", id, String.valueOf(id.length()) };
    }

    public static List<Pair<String, String>> lex(String line) {
        int counter = 0;
        String typ, tok, consumed;
        String result[];
        List<Pair<String, String>> tokens = new ArrayList<>();
        while (counter < line.length()) {
            char ch = line.charAt(counter);
            if (Character.isDigit(ch)) {
                result = lex_num(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.valueOf(consumed);
            } else if (ch == '"' || "'".equals(ch)) {
                result = lex_str(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.valueOf(consumed);
            } else if (ch == '=') {
                typ = "ASSIGN";
                tok = "=";
                counter++;
                tokens.add(new Pair<>(typ, tok));
            } else if (ch == '+') {
                typ = "OPERATION";
                tok = "+";
                counter++;
                tokens.add(new Pair<>(typ, tok));
            } else if (Character.isAlphabetic(ch)) {
                result = lex_id(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.valueOf(consumed);
                tokens.add(new Pair<>(typ, tok));
            }
            else {
                counter++;
            }
        }

        return tokens;
    }

    public static void main(String[] args) {
        // lex("a4");
        Scanner scanner = new Scanner(System.in);
        String orolt = scanner.nextLine();
        List<Pair<String, String>> result = lex(orolt);
        System.out.println(result);
    }
}