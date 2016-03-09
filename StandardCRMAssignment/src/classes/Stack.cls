public class Stack {
    private List<Object> items {get; set;}
    
    public Stack() {
        this.items = new List<Object>();
    }
    
    public Integer size() {
        return this.items.size();
    }

    public Boolean isEmpty() {
        return size() == 0;
    }
        
    public void push(Object itemToPush) {
        this.items.add(itemToPush);
    }
    
    public Object pop() {
        if (isEmpty()) {
            return -1;
        }
        
        return this.items.remove(size() - 1);
    }
    
    public Object peek() {
        if (isEmpty()) {
            return -1;
        }
        
        return this.items.get(size() - 1);
    }    
}