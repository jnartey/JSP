<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Expression Calculator</title>
</head>
<body>
	<%@page import="java.util.Stack" %>
	<%!
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
		
		public Object calculator(String expression) {
			return computate.computeExpression(expression);
		}
	}
	%>
	<form action="" method="post">
		<label for="">Enter Math Expression</label><br />
		<input type="text" id="expression" name="expression" /><br />
		<input type="submit" name="calculate" id="submit-button" value="Calculate" />
	</form>
	<%
		if(request.getParameter("calculate") != null){
			String expression = request.getParameter("expression");
			ExpressionCalculator calc = new ExpressionCalculator();
			out.print("<h2>" + expression + " = " + calc.calculator(expression) + "</h2>");
		}
	%>
</body>
</html>