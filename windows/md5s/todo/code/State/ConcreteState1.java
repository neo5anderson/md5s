package state;

public class ConcreteState1 implements IState {
	private Context context;

	public ConcreteState1(Context context) {
		this.context = context;
	}

	@Override
	public void foo() {
		System.out.println("ConcreteState1");
	}

	@Override
	public void change() {
		context.setState(new ConcreteState2(context));
	}

}
