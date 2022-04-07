package Implementation;

public class ImplementMain {

    public static void main(String[] args) {
        ImplementThread threadFromThreadOne = new ImplementThread();
        ImplementThread threadFromThreadTwo = new ImplementThread();

        // Calling run would just invoke the method run without creating a new thread
        threadFromThreadOne.start();
        threadFromThreadTwo.start();

        ImplementRun threadFromRunnable = new ImplementRun();
        threadFromRunnable.run();
        threadFromRunnable.run();

    }
}
