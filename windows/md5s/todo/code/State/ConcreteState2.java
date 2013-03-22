package state;

public class ConcreteState2 implements IState {
	private Context context;

	public ConcreteState2(Context context) {
		this.context = context;
	}

	@Override
	public void foo() {
		System.out.println("ConcreteState2");
	}

	@Override
	public void change() {
		context.setState(new ConcreteState3(context));
	}

}
