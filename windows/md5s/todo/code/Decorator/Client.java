package decorator;

import decorator.ConcreteComponent;
import decorator.ConcreteDecoratorA;
import decorator.ConcreteDecoratorB;

public class Client {

	public static void main(String[] args) {
		ConcreteComponent component = new ConcreteComponent();
		component.setName("Oops!");
		
		ConcreteDecoratorA decoratorA = new ConcreteDecoratorA();
		ConcreteDecoratorB decoratorB = new ConcreteDecoratorB();

		// decoratorB.setComponent(component);
		decoratorA.setComponent(component);
		decoratorA.foo();
	}

}
