package PrintingThreads;

public class PrintingThreadMain {

    public static void main(String[] args) {
        PrintingThread printingThreadOne = new PrintingThread("'Good to be here today' said Zaland during tech class");
        PrintingThread printingThreadTwo = new PrintingThread("21356876512312641323151241231255123124312312312554768678");
        PrintingThread printingThreadThree = new PrintingThread("#/€!/€#€=#=#%/#€=#€=#€“§™¶™™[¶™£§]±@@@@~~~≠±[“™[¶§∞");

        printingThreadOne.start();
        printingThreadTwo.start();
        printingThreadThree.start();


    }
}
