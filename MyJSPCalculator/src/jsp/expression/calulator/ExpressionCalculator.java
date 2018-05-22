package jsp.expression.calulator;

import java.util.Stack;

public class ExpressionCalculator {
	ExpressionCalculatorInterface computate = new ExpressionCalculatorInterface() {

		@Override
		public Object computeExpression(String expre) {
			Stack<Integer> values = new Stack<Integer>();
			Stack<Character> operand = new Stack<Character>();
			
			for(Integer i = 0; i < expre.length(); i++) {
				if(expre.charAt(i) >= '0' && expre.charAt(i) <= '9') {
					String buf ="";
					
					while(i < expre.length() && expre.charAt(i) >= '0' && expre.charAt(i) <= '9') {
						buf += expre.charAt(i);
						i++;
					}
					
					values.push(Integer.parseInt(buf));
					i--;
				}else if(expre.charAt(i) == '(') {
					operand.push(expre.charAt(i));
				}else if(expre.charAt(i) == ')') {
					while(!operand.empty() && operand.peek() != '(') {
						Integer second = values.pop();
						Integer first = values.pop();
						
						Character op = operand.pop();
						
						Integer result = this.apply(op, first, second);
						values.push(result);
					}
					operand.pop();
				}else if(expre.charAt(i) == '+' || expre.charAt(i) == '-' || expre.charAt(i) == '*' || expre.charAt(i) == '/') {
					while(!operand.isEmpty() && this.precedance(expre.charAt(i), operand.peek())) {
						Integer second = values.pop();
						Integer first = values.pop();
						Character op = operand.pop();
						Integer result = this.apply(op, first, second);
						values.push(result);
					}
					operand.push(expre.charAt(i));
				}
			}
			
			while(!operand.isEmpty()) {
				Integer second = values.pop();
				Integer first = values.pop();
				Character op = operand.pop();
				Integer result = this.apply(op, first, second);
				values.push(result);
			}
			
			return values.pop();
		}
		
	};
	
	public Double calculator(String expression) {
		return (Double) computate.computeExpression(expression);
	}
}
