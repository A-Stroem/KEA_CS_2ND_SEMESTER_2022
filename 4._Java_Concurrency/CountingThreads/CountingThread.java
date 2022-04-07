package CountingThreads;

public class CountingThread extends Thread{

    public void run() {
//        int count = 0;
//        while(count < 100) {
//            count = count+1;
//            System.out.println(count);
//        }

        for (int i = 0; i <= 100; i++) {
            System.out.println(i);
        }

    }
}
