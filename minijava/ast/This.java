package minijava.ast;

public class This implements Exp {
	public int lin;
	
	public This(int _lin) {
		lin = _lin;
	}

	public String toString() {
		return "this";
	}
}
