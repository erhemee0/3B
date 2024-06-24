class For {
    Variable id1, id2, id3;
    IntValue num1, num2;
    String incrementOperator, comparisonOperator;

    public For(Variable id1, IntValue num1, Variable id2, IntValue num2, Variable id3,
               String incrementOperator, String comparisonOperator) {
        this.id1 = id1;
        this.num1 = num1;
        this.id2 = id2;
        this.num2 = num2;
        this.id3 = id3;
        this.incrementOperator = incrementOperator;
        this.comparisonOperator = comparisonOperator;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("for(");
        sb.append("\nhuvisagch zarlagaani heseg ");
        sb.append(id1).append("=").append(num1).append(";");
        sb.append("\ndawtalt duusah nuhtsul ");
        sb.append(id2).append(comparisonOperator).append(num2).append(";");
        sb.append("\ntooluurin uurchlultiin heseg ");
        sb.append(id3).append(incrementOperator).append(")");
        return sb.toString();
    }
}
