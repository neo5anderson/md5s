package decorator;

public abstract class Decorator extends Component {
	private Component component;

	public void setComponent(Component component) {
		this.component = component;
	}

	@Override
	public void foo() {
		component.foo();
	}
	
}
