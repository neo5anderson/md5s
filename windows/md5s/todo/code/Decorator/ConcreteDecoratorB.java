package decorator;

public class ConcreteDecoratorB extends Decorator{

	@Override
	public void foo() {
		super.foo();
		System.out.println("ConcreteDecoratorB");
	}
	
}
