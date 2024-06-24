import java.util.Scanner;

public class lab1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int data[] = new int[2];
        System.out.println("ilerhiillee oruulna uu");
        String input = scanner.nextLine();
        String expression = input.split(";")[0].trim();
        data[0] = Integer.valueOf(Integer.parseInt(input.split(";")[1].split(",")[0].split("=")[1].trim()));
        data[1] = Integer.valueOf(Integer.parseInt(input.split(";")[1].split(",")[1].split("=")[1].trim()));
        evaluate(expression, data);
        scanner.close();
    }

    public static void evaluate(String expression, int data[]) {
        String operator = expression.split(" ")[1];
        int result = 0;
        switch (operator) {
            case "+":
                result = data[0] + data[1];
                break;
            case "-":
                result = data[0] + data[1];
                break;
            case "*":
                result = data[0] + data[1];
                break;
            case "/":
                result = data[0] + data[1];
                break;
            default:
                break;
        }
        System.out.println(expression + " result is: " + result);
    }
}
