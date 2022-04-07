package PrintingThreads;

import java.sql.SQLOutput;
import java.util.concurrent.locks.ReentrantLock;

public class PrintingThread extends Thread{
    String message;
    final static String lock = "I am a lock";
    ReentrantLock reentrantLock = new ReentrantLock();

    public PrintingThread(String message) {
    this.message = message;
    }

    public void run() {
        System.out.println(Thread.currentThread().getName() + " is running");

        reentrantLock.lock();
        //synchronized (lock) {
            for (int i = 0; i < message.length(); i++) {
                System.out.print(message.charAt(i));
            }
            System.out.println();
            reentrantLock.unlock();
    }
}
