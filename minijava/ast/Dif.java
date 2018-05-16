package minijava.ast;

public class Dif implements Exp {
	public Exp e1;
	public Exp e2;
	public int lin;
	
	public Dif(Exp _e1, Exp _e2, int _lin) {
		e1 = _e1;
		e2 = _e2;
		lin = _lin;
	}
	
	public String toString() {
		return "(" + e1 + " != " + e2 + ")";
	}
}
