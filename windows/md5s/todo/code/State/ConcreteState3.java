package state;

public class ConcreteState3 implements IState {
	private Context context;

	public ConcreteState3(Context context) {
		this.context = context;
	}

	@Override
	public void foo() {
		System.out.println("ConcreteState3");
	}

	@Override
	public void change() {
		context.setState(new ConcreteState1(context));
	}

}
