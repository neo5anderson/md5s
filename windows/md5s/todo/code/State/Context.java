package state;

public class Context {
	private IState state;

	public Context() {
		state = new ConcreteState1(this);
	}

	public void setState(IState state) {
		this.state = state;
	}

	public void foo() {
		state.foo();
		state.change();
	}

}
