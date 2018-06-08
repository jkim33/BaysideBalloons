/*****************************************************
 * class RQueue
 * A linked-list-based, randomized queue
 * (a collection with FIIDKO property)
 *
 *       -------------------------------
 *   end |  --->   Q U E U E   --->    | front
 *       -------------------------------
 *
 *  linkages point opposite direction for O(1) en/dequeuing
 *            N <- N <- ... <- N <- N
 *      _end -^                     ^- _front
 *
 ******************************************************/


public class RQueue<T> implements Queue<T>
{
  //instance variables
  private LLNode<T> _front, _end;
  private int _size;


  // default constructor creates an empty queue
  public RQueue() 
	{ 
    _front = _end = null;
    _size = 0;
	}//end default constructor


  public void enqueue( T enQVal ) 
  {
    //special case: when enqueuing to an empty list, 
    //make _front && _end point to same node
    if ( isEmpty() ) {
	    _front = _end = new LLNode<T>( enQVal, null );
    }
    else {
	    _end.setNext( new LLNode<T>( enQVal, null ) );
	    _end = _end.getNext();
    }
    _size++;
  }//end enqueue()


  // remove and return thing at front of queue
  // assume _queue ! empty
  public T dequeue() 
  { 
    T retVal = _front.getValue();
    _front = _front.getNext();

    if ( _front == null ) //just moved past last node
	    _end = null;      //update _end to reflect emptiness

    _size--;

    if ( _size > 1 )  sample();

    return retVal;
  }//end dequeue()


  public T peekFront() 
  {
    return _front.getValue();

  }


  /******************************************
   * void sample() -- a means of "shuffling" the queue
   * Algo:
   * Move front element to end, x times. (x=random int)
   *  ( 0 <= x < queue size - 1 )
   ******************************************/
  public void sample () 
  {
    int cycles = (int)( _size * Math.random() );
    for( int i = 0; i < cycles; i++ )
	    enqueue( dequeue() );
  }//end sample()


  public boolean isEmpty() 
  {
    return _front == null;
  } //O(1)


    // print each node, separated by spaces
  public String toString() 
  { 
    String foo = "";
    LLNode<T> tmp = _front;
    while ( tmp != null ) {
	    foo += tmp.getValue() + " ";
	    tmp = tmp.getNext();
    }
    return foo;
  }//end toString()



  //main method for testing
  public static void main( String[] args )
  {
    Queue<String> PirateQueue = new RQueue<String>();

    System.out.println("\nnow enqueuing..."); 
    PirateQueue.enqueue("Dread");
    PirateQueue.enqueue("Pirate");
    PirateQueue.enqueue("Robert");
    PirateQueue.enqueue("Blackbeard");
    PirateQueue.enqueue("Peter");
    PirateQueue.enqueue("Stuyvesant");

    System.out.println("\nnow testing toString()..."); 
    System.out.println( PirateQueue ); //for testing toString()...

    System.out.println("\nnow dequeuing..."); 
    System.out.println( PirateQueue.dequeue() );
    System.out.println( PirateQueue.dequeue() );
    System.out.println( PirateQueue.dequeue() );
    System.out.println( PirateQueue.dequeue() );
    System.out.println( PirateQueue.dequeue() );
    System.out.println( PirateQueue.dequeue() );

    System.out.println("\nnow dequeuing fr empty queue...\n" +
                       "(expect NPE)\n"); 
    System.out.println( PirateQueue.dequeue() );

    /*v~~~~~~~~~~~~~~MAKE MORE~~~~~~~~~~~~~~v
      ^~~~~~~~~~~~~~~~AWESOME~~~~~~~~~~~~~~~^*/

  }//end main

}//end class RQueue
