package decorator;

public class ConcreteDecoratorA extends Decorator{

	@Override
	public void foo() {
		super.foo();
		System.out.println("ConcreteDecoratorA");
	}
	
}
