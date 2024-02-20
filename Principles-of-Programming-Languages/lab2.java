import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Pair<A, B> {
    public final A type;
    public final B value;

    public Pair(A type, B value) {
        this.type = type;
        this.value = value;
    }
}

public class lab2 {
    public static String[] lexNum(String line) {
        String num = "";
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (!Character.isDigit(c)) {
                break;
            }
            num += c;
        }
        return new String[] { "num", num, String.valueOf(num.length()) };
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
        return new String[] { "str", string, String.valueOf(string.length()) };
    }

    public static String[] lexId(String line) {
        List<String> keywords = List.of("print", "int", "while", "if", "elif", "else");
        String id = "";
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (!Character.isDigit(c) && !Character.isAlphabetic(c) || c == ' ' || c == '=') {
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
        String[] result;
        List<Pair<String, String>> tokens = new ArrayList<>();
        while (counter < line.length()) {
            char ch = line.charAt(counter);
            if (Character.isDigit(ch)) {
                result = lexNum(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.parseInt(consumed);
                tokens.add(new Pair<>(typ, tok));
            } else if (ch == '"' || ch == '\'') {
                result = lexStr(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.parseInt(consumed);
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
            } else if (ch == '-') {
                typ = "OPERATION";
                tok = "-";
                counter++;
                tokens.add(new Pair<>(typ, tok));
            } else if (ch == '*') {
                typ = "OPERATION";
                tok = "*";
                counter++;
                tokens.add(new Pair<>(typ, tok));
            } else if (ch == '/') {
                typ = "OPERATION";
                tok = "/";
                counter++;
                tokens.add(new Pair<>(typ, tok));
            } else if (Character.isAlphabetic(ch)) {
                result = lexId(line.substring(counter));
                typ = result[0];
                tok = result[1];
                consumed = result[2];
                counter += Integer.parseInt(consumed);
                tokens.add(new Pair<>(typ, tok));
            } else {
                counter++;
            }
        }

        return tokens;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String operation = "";
        int num1, num2, res=0;
        List<Pair<String, String>> result;

        System.out.println("Оролтын утга:");
        String input = scanner.nextLine();
        result = lex(input);

        System.out.println("Tokens:");
        for (Pair<String, String> pair : result) {
            System.out.println("(" + pair.type + ", " + pair.value + ")");
        }
        List<String> types = new ArrayList<>();
        for (Pair<String, String> token : result) {
            types.add(token.type);
        }
        System.out.println("Tokenii turuluud: " + types);

        List<Integer> nums = new ArrayList<>();
        for (Pair<String, String> token : result) {
            if ("num".equals(token.type)) {
                nums.add(Integer.valueOf(token.value));
            }
        }
        System.out.println("Toonuud: " + nums);
        for (Pair<String, String> token : result) {
            if ("OPERATION".equals(token.type)) {
                operation = token.value;
            }
        }
        System.out.println("Uildel: " + operation);
        num1 = nums.get(0);
        num2 = nums.get(1);
        if ("+".equals(operation)) {
            res = num1 + num2;
        } else if ("-".equals(operation)) {
            res = num1 - num2;
        } else if ("*".equals(operation)) {
            res = num1 * num2;
        } else if ("/".equals(operation)) {
            res = num1 / num2;
        } else {
            System.out.println("Tanihgui uildel bn");
        }
        System.out.println("Garalt: " + res);
        scanner.close();
    }
}