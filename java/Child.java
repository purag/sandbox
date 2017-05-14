import java.util.List;
import java.util.ArrayList;

interface SuperInterface<A, B> {
    List<A> foo();
    List<B> bar();
}

public interface Child<Q> extends SuperInterface<Q, Q> {
    public default List<Q> foo () {
        return bar();
    }

    static <T> Child<T> getSingleton () {
        return () -> new ArrayList<T>();
    }

    public static void main (String [] args) {
        List<String> a = Child.<String>getSingleton().foo(); //is valid
        System.out.println("a = " + a);
        List<String> b = Child.<String>getSingleton().bar(); //is valid
        System.out.println("b = " + b);
        List<Integer> c = Child.<Integer>getSingleton().foo(); //is valid
        System.out.println("c = " + c);
        System.out.println((Object)Child.<String>getSingleton() == (Object)Child.<Integer>getSingleton());
    }
}
