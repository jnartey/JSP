package jsp.expression.calulator;

@FunctionalInterface
public interface ExpressionCalculatorInterface {
	public Object computeExpression(String expression);
	public default Integer apply(Character op, Integer first, Integer second) {
		switch(op) {
			case '+':
				return first + second;
			case '-':
				return first - second;
			case '*':
				return first * second;
			case '/':
				if(second == 0) {
					return 0;
				}
				return first / second;
			default:
				System.out.println("Invalid Operand");
				return -1;
		}
	}
	
	public default Boolean precedance(Character fromExpre, Character fromStack) {
		Boolean isHigher = null;
		
		if(fromStack == '(') {
			isHigher = false;
		}else if((fromStack == '+' || fromStack == '-') && (fromExpre == '*' || fromExpre == '/')) {
			isHigher = false;
		}else {
			isHigher = true;
		}
		return isHigher;
	}
}
