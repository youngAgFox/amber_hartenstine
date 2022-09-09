# Java Generics Review!
Generics are a way for us to make a function or class take a parameter
of any object type (and since primitives have wrapper object classes in Java, generics can be used with any type in Java).

On a method (or function), generics are defined by specifying the Type variable before the return type like so:

```java
    // in a class...

    public <T> void gimme(T object) {
        // etc...
        return object;
    }
```

The `T` is not special. It is just common practice to label a one off like that as 'T' since it stands for 'Type'. In the `Map` interface for example, this is substituted for `<K,V>`, which is for 'Key' and 'Value' respectively.

In a class, this works similarly but the definition goes after the name like so:

```java
public class Bag<T> {
    // class code...
}
```

A full example might look like this:

```java
public class Bag<T> {
    private List<T> bag;

    public Bag() {
        bag = new LinkedList<T>();
    }

    public void addItem(T item) {
        bag.add(item);
    }

    // etc...
}
```

In fact, generics can utilize multiple types in both functions and classes. Here is an example:

```java
public class BagMap<K,V> {
    private HashMap<K,V> bagMap;

    public BagMap() {
        bagMap = new HashMap<>();
    }


    // multitype function
    public <T,Q> void doSomething(T obj, Q queen) {
        // logic here...
    }
    
}
```

## Specifying Generics

We can take only particular types of objects for our generic functions or classes. For example, we could say we only want objects that follow the `Comparable` interface in java, meaning that on any given object that we receive, we know that we can call the respective `compareTo()` function. We simply speficy the Type variable with the `extends` keyword. Check this out:

```java
public class TestSemiGeneric {

    public <T extends Comparable<T>> int compare(T obj1, T obj2) {
            return obj1.compareTo(obj2);
    }
}
```

As you can see, we can also use that type variable in the `Comparable` type to specify that the object should be comparable with its own type.