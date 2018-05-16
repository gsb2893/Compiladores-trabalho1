package minijava.ast;

public class Println implements Cmd {
	public Exp exp;
	public int lin;
	
	public Println(Exp _exp, int _lin) {
		exp = _exp;
		lin = _lin;
	}

	public String toString() {
		return "System.out.println(" + exp + ");";
	}
}
