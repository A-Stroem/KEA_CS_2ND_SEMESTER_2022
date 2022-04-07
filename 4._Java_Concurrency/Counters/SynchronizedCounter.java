package Counters;

public class SynchronizedCounter {

    private int counter = 0;

    public int getCounter() {
        return counter;
    }

//  thread 1: read counter = 0
//  thread 1: adds counter = 1
//  thread 2: read counter = 0
//  thread 1: save counter = 1
//  thread 2: adds counter = 1
//  thread 2: save counter = 1

    public synchronized void increment() {
        counter += 1;
    }

    public synchronized void decrement() {
        counter -= 1;
    }

}
