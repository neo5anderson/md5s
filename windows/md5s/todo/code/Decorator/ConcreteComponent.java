package decorator;

public class ConcreteComponent extends Component {

	@Override
	public void foo() {
		System.out.println(getName());
	}

}
